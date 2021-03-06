# Autogenerated from a Treetop grammar. Edits may be lost.


require "hemingway/footnote/footnote_nodes"

module Hemingway
  module Footnote
    include Treetop::Runtime

    def root
      @root ||= :footnote
    end

    module Footnote0
      def sequence
        elements[1]
      end

    end

    def _nt_footnote
      start_index = index
      if node_cache[:footnote].has_key?(index)
        cached = node_cache[:footnote][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      if has_terminal?("\\footnote{", false, index)
        r1 = instantiate_node(SyntaxNode,input, index...(index + 10))
        @index += 10
      else
        terminal_parse_failure("\\footnote{")
        r1 = nil
      end
      s0 << r1
      if r1
        s2, i2 = [], index
        loop do
          r3 = _nt_content
          if r3
            s2 << r3
          else
            break
          end
        end
        r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
        s0 << r2
        if r2
          if has_terminal?("}", false, index)
            r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure("}")
            r4 = nil
          end
          s0 << r4
        end
      end
      if s0.last
        r0 = instantiate_node(FootnoteNode,input, i0...index, s0)
        r0.extend(Footnote0)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:footnote][start_index] = r0

      r0
    end

  end

  class FootnoteParser < Treetop::Runtime::CompiledParser
    include Footnote
  end

end