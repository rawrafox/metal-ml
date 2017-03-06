#!/usr/bin/env ruby

require "active_support"
require "active_support/core_ext"
require "nokogiri"

$: << "#{__dir__}/lib"

require "bridge/output"

module Bridge
  def self.type_lookup(t)
    {
      "*mut std::os::raw::c_void" => "(ptr void)",
      "*const std::os::raw::c_void" => "(ptr void)",
      "*mut std::os::raw::c_char" => "string",
      "*const std::os::raw::c_char" => "string",
      "i8" => "int8_t",
      "i16" => "int16_t",
      "i32" => "int32_t",
      "i64" => "int64_t",
      "isize" => "intptr_t",
      "u8" => "uint8_t",
      "u16" => "uint16_t",
      "u32" => "uint32_t",
      "u64" => "uint64_t",
      "usize" => "uintptr_t",
      "f32" => "float",
      "f64" => "double"
    }.fetch(t) { t.underscore }
  end

  def self.type_constructor_lookup(t)
    {
      "*mut std::os::raw::c_void" => "unit ptr",
      "*const std::os::raw::c_void" => "unit ptr",
      "*mut std::os::raw::c_char" => "string",
      "*const std::os::raw::c_char" => "string",
      "i8" => "int8_t typ",
      "i16" => "int16_t typ",
      "i32" => "int32_t typ",
      "i64" => "int64_t typ",
      "isize" => "Intptr.t",
      "u8" => "uint8_t typ",
      "u16" => "uint16_t typ",
      "u32" => "uint32_t typ",
      "u64" => "uint64_t typ",
      "usize" => "Uintptr.t",
      "f32" => "float typ",
      "f64" => "float typ"
    }.fetch(t) { t.underscore }
  end

  class Node
    def initialize(node, parent:)
      if class_node_name = self.class.node
        unless class_node_name == node.name
          raise ArgumentError, "expected node name '#{class_node_name}' but got '#{node.name}'"
        end
      end

      self.prepare(node, parent: parent)

      children = node.children.map do |child|
        self.prepare_child(child, parent: self)
      end.compact

      @children = children if children.length > 0
    end

    def children
      @children || []
    end

    def prepare_child(_, parent:)
    end

    def to_ocaml(_)
    end

    def to_ocaml_extern(_)
    end

    def to_ocaml_implementation(_ = nil)
    end

    def to_ocaml_prelude(_)
    end

    def self.node(value = nil)
      if value
        @node = value
      else
        @node
      end
    end
  end

  class Framework < Node
    node "framework"

    def prepare(node, parent:)
      @module = node['module']
      @no_prelude = true if node.has_attribute?('no-prelude')
    end

    def prepare_child(node, parent:)
      case node.name
      when "alias"
        Alias.new(node, parent: parent)
      when "class"
        Class.new(node, parent: parent)
      when "enumeration"
        Enumeration.new(node, parent: parent)
      when "extern"
        Extern.new(node, parent: parent)
      when "function"
        Function.new(node, parent: parent)
      when "module"
        Module.new(node, parent: parent)
      when "protocol"
        Protocol.new(node, parent: parent)
      when "script"
        Script.new(node, parent: parent)
      when "structure"
        Structure.new(node, parent: parent)
      when "use"
        Use.new(node, parent: parent)
      end
    end

    def to_ocaml(o)
      o.puts("open Ctypes", pad: true)
      self.children.each { |c| c.to_ocaml_prelude(o) }

      o.block("module Implementation = struct", pad: true) do |o|
        o.block("module Extern = struct", pad: true) do |o|
          self.children.each { |c| c.to_ocaml_extern(o) }
        end

        o.puts("open Extern", pad: true)

        o.blast(self.children.map { |c| c.to_ocaml_implementation }.compact, prefix: "class ", join: " and ", pad: true)
      end

      o.puts("open Implementation", pad: true)
      o.puts("open Implementation.Extern")

      self.children.each { |c| c.to_ocaml(o) }
    end
  end

  class Protocol < Node
    node "protocol"

    attr_reader :name, :inherits

    def prepare(node, parent:)
      @name = node["name"]

      specific = node["inherits_mac"].try(:split, ",") || []
      generic = node["inherits"].try(:split, ",") || []

      @inherits = (specific + generic).map(&:strip)
    end

    def prepare_child(node, parent:)
      case node.name
      when "initializer"
        Initializer.new(node, parent: parent)
      when "method"
        Method.new(node, parent: parent)
      when "class-method"
        ClassMethod.new(node, parent: parent)
      when "property"
        Property.new(node, parent: parent)
      when "script"
        Script.new(node, parent: parent)
      when "text"
        Text.new(node, parent: parent)
      end
    end

    def initializers(o)
      pad = true
      children.select { |x| x.is_a? Initializer }.each do |initializer|
        arguments = initializer.arguments.map { |a| " #{a.name}"}.join

        o.puts("let #{initializer.static_name}#{arguments == "" ? " ()" : arguments} = (alloc ())##{initializer.name}#{arguments}", pad: pad)
        pad = false
      end
    end

    def class_methods(o)
      pad = true
      children.select { |x| x.is_a? ClassMethod }.each do |initializer|
        initializer.to_ocaml_class_method(o)
        pad = false
      end
    end

    def to_ocaml(o)
      o.block("module #{name} = struct", pad: true) do |o|
        o.puts("class t = Implementation.#{name.underscore}", pad: true)
        o.puts("let klass = #{name.underscore}_class") if self.is_a?(Class)

        self.initializers(o)
        self.class_methods(o)
      end
    end

    def to_ocaml_extern(o)
      children.each { |child| child.to_ocaml_extern(o) }
    end

    def to_ocaml_implementation
      Bridge::Output.new(StringIO.new).tap do |o|
        o.puts("#{name.underscore} (ptr: ObjC.id) = object (self)")

        o.indent do
          if inherits.count == 0
            o.puts("inherit ObjC.Object.t ptr", pad: true)
          else
            inherits.each do |klass|
              o.puts("inherit #{klass.underscore} ptr", pad: true)
            end
          end

          self.children.each { |child| child.to_ocaml_implementation(o) }
        end

        o.print("end")
      end
    end
  end

  class Class < Protocol
    node "class"

    def initializers(o)
      o.puts("let alloc () = new t (ObjC.alloc #{name.underscore}_class)", pad: true)
      o.puts("let nil () = new t (ObjC.nil)")
      super
    end

    def to_ocaml_extern(o)
      o.puts("let #{name.underscore}_class = ObjC.get_class \"#{name}\"", pad: true)

      super
    end
  end

  class Alias < Node
    node "alias"

    attr_reader :name, :type

    def prepare(node, parent:)
      @name = node['name']
      @type = node['type']
    end

    def to_ocaml_extern(o)
      o.puts("type #{@name.underscore} = #{Bridge.type_constructor_lookup(@type)}", pad: true)
      o.puts("let #{@name.underscore} = #{Bridge.type_lookup(@type)}")
    end

    def to_ocaml(o)
      o.block "module #{@name} = struct", pad: true do |o|
        o.puts "let t = #{@name.underscore}"
      end
    end
  end

  class Argument < Node
    node "argument"

    attr_reader :name
    attr_reader :kind, :error, :protocol, :type

    def name
      {
        "class" => "klass",
        "object" => "obj",
        "ptr" => "pointer"
      }.fetch(@name, @name)
    end

    def prepare(node, parent:)
      @name = node['name'].underscore

      if node.has_attribute?('error')
        @kind = 'error'
        @error = node['error']
      end

      if node.has_attribute?('protocol')
        raise ArgumentError, "multiple values defined" if @kind
        @kind = 'protocol'
        @protocol = node['protocol']
      end

      if node.has_attribute?('type')
        raise ArgumentError, "multiple values defined" if @kind
        @kind = 'type'
        @type = node['type']
      end
    end

    def to_ocaml_extern
      case self.kind
      when "error"
        "ptr ObjC.id"
      when "protocol"
        "ObjC.id"
      when "type"
        Bridge.type_lookup(self.type)
      else
        raise ArgumentError
      end
    end

    def to_ocaml_implementation
      case self.kind
      when "error"
        "ObjC.id ptr"
      when "protocol"
        protocol.underscore
      when "type"
        Bridge.type_constructor_lookup(self.type)
      else
        raise ArgumentError
      end
    end
  end

  class Enumeration < Node
    node "enumeration"

    attr_reader :name, :type

    def prepare(node, parent:)
      @name = node['name']
      @type = node['type']
    end

    def prepare_child(node, parent:)
      case node.name
      when "value"
        Value.new(node, parent: parent)
      end
    end

    def to_ocaml(o)
      o.block "module #{@name} = struct", pad: true do |o|
        o.puts "let t = #{@name.underscore}"
      end
    end

    def to_ocaml_extern(o)
      o.puts("type #{@name.underscore} = int", pad: true)
      o.puts("let #{@name.underscore} = int")
    end
  end

  class Extern < Node
    node "extern"

    attr_reader :framework

    def prepare(node, parent:)
      @framework = node['framework']
    end

    def prepare_child(node, parent:)
      case node.name
      when "static"
        Static.new(node, parent: parent)
      end
    end
  end

  class Field < Node
    attr_reader :name, :type

    def prepare(node, parent:)
      @name = node["name"]
      @type = node["type"]
      @private = node.has_attribute?('private')
      @parent_name = parent.name
    end

    def to_ocaml_extern(o)
      o.puts "let #{@parent_name.underscore}_#{@name.underscore} = field #{@parent_name.underscore} \"#{@name}\" #{Bridge.type_lookup(@type)}"
    end
  end

  class Function < Node
    attr_reader :name

    def prepare(node, parent:)
      @name = node["name"]
    end

    def arguments
      children.select { |x| x.is_a? Argument }
    end

    def prepare_child(node, parent:)
      case node.name
      when "return"
        Return.new(node, parent: parent)
      end
    end

    def return_node
      return_nodes = children.select { |child| child.is_a?(Return) }
      case return_nodes.length
      when 0
      when 1
        return_nodes.first
      else
        raise ArgumentError
      end
    end

    def to_ocaml(o)
      fn = name.underscore.split("_", 2).last

      o.puts("let #{fn} () = new #{return_node.protocol}.t (#{name.underscore} ())", pad: true)
    end

    def to_ocaml_extern(o)
      if arguments.count > 0
        raise ArgumentError, "Not supported yet"
      end

      if return_node
        case return_node.kind
        when "protocol"
          o.puts("let #{name.underscore} = Foreign.foreign \"#{name}\" (void @-> returning ObjC.id)", pad: true)
        else
          raise ArgumentError, "Not supported yet"
        end
      else
        raise ArgumentError
      end
    end
  end

  class Initializer < Node
    node "initializer"

    attr_reader :selector

    def prepare(node, parent:)
      @selector = node['selector']
      @parent_name = parent.name
    end

    def arguments
      children.select { |x| x.is_a? Argument }
    end

    def prepare_child(node, parent:)
      case node.name
      when "argument"
        Argument.new(node, parent: parent)
      end
    end

    def name
      self.selector.gsub(/:\z/, "").tr(":", "_").underscore
    end

    def static_name
      if self.name == "init"
        @parent_name.underscore.split("_", 2).last
      else
        self.name.gsub(/\Ainit_/, "new_")
      end
    end

    def to_ocaml_extern(o)
      args = arguments.map { |a| a.to_ocaml_extern + " @-> " }.join

      o.puts("let #{@parent_name.underscore}_#{name} = ObjC.message_send \"#{selector}\" (#{args}returning ObjC.id)")
    end

    def to_ocaml_implementation(o)
      ocaml_args = arguments.map { |a| a.kind == "type" ? " #{a.name}" : " (#{a.name} : #{a.to_ocaml_implementation})" }.join
      ffi_args = arguments.map { |a| " #{a.name}#{"#get_id" if a.kind == "protocol"}" }.join

      o.puts("method #{name}#{ocaml_args} = new #{@parent_name.underscore} (#{@parent_name.underscore}_#{name} ptr#{ffi_args})")
    end
  end

  class Method < Node
    node "method"

    attr_reader :selector

    def prepare(node, parent:)
      @selector = node['selector']
      @parent_name = parent.name
    end

    def arguments
      children.select { |x| x.is_a? Argument }
    end

    def prepare_child(node, parent:)
      case node.name
      when "argument"
        Argument.new(node, parent: parent)
      when "return"
        Return.new(node, parent: parent)
      end
    end

    def return_node
      return_nodes = children.select { |child| child.is_a?(Return) }
      case return_nodes.length
      when 0
      when 1
        return_nodes.first
      else
        raise ArgumentError
      end
    end

    def name
      self.selector.gsub(/:\z/, "").tr(":", "_").underscore
    end

    def to_ocaml_extern(o)
      args = arguments.map { |a| a.to_ocaml_extern + " @-> " }.join

      if return_node
        case return_node.kind
        when "type"
          o.puts "let #{@parent_name.underscore}_#{name} = ObjC.message_send \"#{selector}\" (#{args}returning #{Bridge.type_lookup(return_node.type)})"
        when "protocol"
          o.puts "let #{@parent_name.underscore}_#{name} = ObjC.message_send \"#{selector}\" (#{args}returning ObjC.id)"
        when "generic"
          # Implement this
        else
          raise ArgumentError, "Unknown kind #{return_node.kind}"
        end
      else
        o.puts "let #{@parent_name.underscore}_#{name} = ObjC.message_send \"#{selector}\" (#{args}returning void)"
      end
    end

    def to_ocaml_implementation(o)
      ocaml_args = arguments.map { |a| a.kind == "type" ? " #{a.name}" : " (#{a.name} : #{a.to_ocaml_implementation})" }.join
      ffi_args = arguments.map { |a| " #{a.name}#{"#get_id" if a.kind == "protocol"}" }.join

      if return_node
        case return_node.kind
        when "type"
          o.puts("method #{name}#{ocaml_args} = #{@parent_name.underscore}_#{name} ptr#{ffi_args}")
        when "protocol"
          o.puts("method #{name}#{ocaml_args} = new #{return_node.protocol.underscore} (#{@parent_name.underscore}_#{name} ptr#{ffi_args})")
        when "generic"
          # Implement this
        else
          raise ArgumentError, "Unknown kind #{return_node.kind}"
        end
      else
        o.puts("method #{name}#{ocaml_args} = #{@parent_name.underscore}_#{name} ptr#{ffi_args}")
      end
    end
  end

  class ClassMethod < Method
    node "class-method"

    def to_ocaml_implementation(_)
    end

    def to_ocaml_class_method(o)
      ocaml_args = arguments.map { |a| " (#{a.name} : #{a.to_ocaml_implementation})" }.join
      ffi_args = arguments.map { |a| " #{a.name}#{"#get_id" if a.kind == "protocol"}" }.join

      ocaml_args = " ()" if ocaml_args == ""

      fn = "#{@parent_name.underscore}_#{name}"
      klass = "#{@parent_name.underscore}_class"

      if return_node
        case return_node.kind
        when "type"
          o.puts("let #{name}#{ocaml_args} = #{fn} #{klass}#{ffi_args}")
        when "protocol"
          o.puts("let #{name}#{ocaml_args} = new t (#{fn} #{klass}#{ffi_args})")
        when "generic"
          # Implement this
        else
          raise ArgumentError, "Unknown kind #{return_node.kind}"
        end
      else
        o.puts("let #{name}#{ocaml_args} = #{fn} #{klass}#{ffi_args}")
      end
    end
  end

  class Module < Node
    attr_reader :name

    def prepare(node, parent:)
      @name = node["name"]
      @private = node.has_attribute?('private')
    end
  end

  class Property < Node
    node "property"

    attr_reader :name
    attr_reader :kind, :protocol, :type
    attr_reader :getter, :setter

    def read_only?
      @read_only
    end

    def weak?
      @weak
    end

    def prepare(node, parent:)
      @name = node['name']
      @parent_name = parent.name

      if node.has_attribute?('protocol')
        @kind = 'protocol'
        @protocol = node['protocol']
      end

      if node.has_attribute?('type')
        raise ArgumentError, "multiple values defined" if @kind
        @kind = 'type'
        @type = node['type']
      end

      raise ArgumentError, "no value defined" unless @kind

      @read_only = node.has_attribute?('read-only')
      @weak = node.has_attribute?('weak')

      @getter = node['getter'] || @name
      @setter = node['setter'] || "set#{@name.upcase_first}:"
    end

    def to_ocaml_extern(o)
      t = case self.kind
      when "protocol"
        "ObjC.id"
      when "type"
        Bridge.type_lookup(self.type)
      else
        raise ArgumentError
      end

      o.puts "let #{@parent_name.underscore}_get_#{name.underscore} = ObjC.message_send \"#{getter}\" (returning #{t})"
      o.puts "let #{@parent_name.underscore}_set_#{name.underscore} = ObjC.message_send \"#{setter}\" (#{t} @-> returning void)"
    end

    def to_ocaml_implementation(o)
      case self.kind
      when "protocol"
        o.puts("method #{name.underscore} = new #{protocol.underscore} (#{@parent_name.underscore}_get_#{name.underscore} ptr)")
        o.puts("method set_#{name.underscore} (value : #{protocol.underscore}) = #{@parent_name.underscore}_set_#{name.underscore} ptr value#get_id") unless read_only?
      when "type"
        o.puts("method #{name.underscore} = #{@parent_name.underscore}_get_#{name.underscore} ptr")
        o.puts("method set_#{name.underscore} value = #{@parent_name.underscore}_set_#{name.underscore} ptr value") unless read_only?
      else
        raise ArgumentError
      end
    end
  end

  class Return < Node
    node "return"

    attr_reader :kind, :protocol, :type, :generic

    def prepare(node, parent:)
      if node.has_attribute?('protocol')
        @kind = 'protocol'
        @protocol = node['protocol']
      end

      if node.has_attribute?('type')
        raise ArgumentError, "multiple values defined" if @kind
        @kind = 'type'
        @type = node['type']
      end

      if node.has_attribute?('generic')
        raise ArgumentError, "multiple values defined" if @kind
        @kind = 'generic'
        @generic = node['generic']
      end

      raise ArgumentError, "no value defined" unless @kind
    end
  end

  class Script < Node
    node "script"

    attr_reader :type, :content

    def prepare(node, parent:)
      @type = node['type']
      @content = node.text.strip
    end
  end

  class Static < Node
    attr_reader :name
    attr_reader :kind, :protocol, :type

    def prepare(node, parent:)
      @name = node["name"]
      @public = node.has_attribute?('public')

      if node.has_attribute?('protocol')
        @kind = 'protocol'
        @protocol = node['protocol']
      end

      if node.has_attribute?('type')
        raise ArgumentError, "multiple values defined" if @kind
        @kind = 'type'
        @type = node['type']
      end
    end
  end

  class Structure < Node
    node "structure"

    attr_reader :name

    def prepare(node, parent:)
      @name = node['name']
    end

    def prepare_child(node, parent:)
      case node.name
      when "field"
        Field.new(node, parent: parent)
      end
    end

    def to_ocaml(o)
      o.block "module #{@name} = struct", pad: true do |o|
        o.puts("type t = #{@name.underscore}", pad: true)
        o.puts("let t = #{@name.underscore}")
        self.children.each { |c| o.puts("let #{c.name.underscore} = #{name.underscore}_#{c.name.underscore}") }

        args = self.children.map { |c| "#{c.name.underscore}_v" }.join(" ")
        o.puts("let make #{args} =", pad: true)
        o.indent do |o|
          o.puts "let result = make t in"
          self.children.each do |c|
            o.puts("setf result #{c.name.underscore} #{c.name.underscore}_v;")
          end
          o.puts "result"
        end
      end
    end

    def to_ocaml_extern(o)
      o.puts("type #{@name.underscore}_t", pad: true)
      o.puts("type #{@name.underscore} = #{@name.underscore}_t structure")
      o.puts("let #{@name.underscore} : #{@name.underscore} typ = structure \"#{@name}\"")
      self.children.each { |c| c.to_ocaml_extern(o) }
      o.puts("let () = seal #{@name.underscore}")
    end
  end

  class Use < Node
    attr_reader :use

    def prepare(node, parent:)
      @use = node.text
      @private = !node.has_attribute?('public')
    end

    def to_ocaml_prelude(o)
      name = @use.split("::", 2).first.camelize

      o.puts("open #{name}")
      o.puts("open #{name}.Implementation")
      o.puts("open #{name}.Implementation.Extern")
    end
  end

  class Value < Node
    attr_reader :name, :value

    def prepare(node, parent:)
      @name = node["name"]
      @value = node["value"]
    end
  end

  class Text < Node
    def prepare(node, parent:)
      @node = node
    end
  end

  def self.generate(from, output)
    xml = Nokogiri::HTML.fragment(from).child

    Bridge::Framework.new(xml, parent: nil).to_ocaml(output)
  end
end

if $0 == __FILE__
  Bridge.generate(File.read(ARGV[0]), Bridge::Output.new(STDOUT))
end
