module Bridge
  class Output
    attr_accessor :indent, :stream

    def initialize(stream)
      @stream = stream
      @n_indent = 0
      @indent = "  "
      @pre_padded = true
      @last_group = nil
    end

    def blast(os, prefix: "", join: "", pad: false)
      if os.length > 0
        if pad
          if @pre_padded
            @pre_padded = false
          else
            @stream.puts
          end
        end

        self.puts_all(prefix + os.map { |o| o.stream.string }.join(join))
      end
    end

    def print(line)
      @stream.print(line)
    end

    def puts_all(lines)
      lines.split("\n").each { |line| self.puts(line) }
    end

    def puts(line = nil, comment: nil, pad: false, group: nil)
      if group
        @last_group = group unless @last_group

        if @last_group != group
          @last_group = group
          @stream.puts unless pad
        end
      end

      if pad
        if @pre_padded
          @pre_padded = false
        else
          @stream.puts
        end
      end

      if line
        line = line + " // #{comment}" if comment
        @stream.puts(@indent * @n_indent + line)
      else
        @stream.puts(comment ? "#{@indent * @n_indent}// #{comment}" : '')
      end
    end

    def indent
      @n_indent += 1
      yield self
      @n_indent -= 1
    end

    def block(line, comment: nil, pad: false, &block)
      self.puts(line, comment: comment, pad: pad)
      old, @pre_padded = @pre_padded, true
      @last_group = nil
      self.indent(&block)
      @pre_padded = old
      @last_group = nil
      self.puts("end\n")
    end
  end
end
