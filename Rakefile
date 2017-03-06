$: << "#{__dir__}/generator"

require "shellwords"

require "objc-bridge-generator"

XML = Rake::FileList["#{__dir__}/generator/xml/*.xml"]
XML_ML = XML.pathmap("#{__dir__}/src/%{.*,*}n.ml") { |x| ActiveSupport::Inflector.camelize(x, false) }
XML_ML_MAP = XML_ML.zip(XML).to_h

METAL = Rake::FileList["#{__dir__}/**/*.metal"]

task default: [:objc_bridge]

task objc_bridge: XML_ML

rule ".ml" => -> (f) { [XML_ML_MAP.fetch(f), "#{__dir__}/generator/objc-bridge-generator.rb"] } do |t|
  puts "Generating ObjC bridge (#{t.name} from #{t.source})"

  io = StringIO.new
  Bridge.generate(File.read(t.source), Bridge::Output.new(io))
  File.write(t.name, io.string)
end
