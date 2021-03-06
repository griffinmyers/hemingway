# Autogenerated from a Treetop grammar. Edits may be lost.


require "hemingway/block/verbatim/verbatim_nodes"

module Hemingway
  module Block
    module Verbatim
      include Treetop::Runtime

      def root
        @root ||= :verbatim
      end

      def _nt_verbatim
        start_index = index
        if node_cache[:verbatim].has_key?(index)
          cached = node_cache[:verbatim][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        r0 = _nt_verbatim_text

        node_cache[:verbatim][start_index] = r0

        r0
      end

      def _nt_verbatim_type
        start_index = index
        if node_cache[:verbatim_type].has_key?(index)
          cached = node_cache[:verbatim_type][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        if has_terminal?("verbatim", false, index)
          r0 = instantiate_node(VerbatimNode,input, index...(index + 8))
          @index += 8
        else
          terminal_parse_failure("verbatim")
          r0 = nil
        end

        node_cache[:verbatim_type][start_index] = r0

        r0
      end

      module VerbatimText0
        def block_end
          elements[0]
        end

        def verbatim_type
          elements[1]
        end

      end

      module VerbatimText1
      end

      def _nt_verbatim_text
        start_index = index
        if node_cache[:verbatim_text].has_key?(index)
          cached = node_cache[:verbatim_text][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        s0, i0 = [], index
        loop do
          i1, s1 = index, []
          i2 = index
          i3, s3 = index, []
          r4 = _nt_block_end
          s3 << r4
          if r4
            r5 = _nt_verbatim_type
            s3 << r5
            if r5
              if has_terminal?("}", false, index)
                r6 = instantiate_node(SyntaxNode,input, index...(index + 1))
                @index += 1
              else
                terminal_parse_failure("}")
                r6 = nil
              end
              s3 << r6
            end
          end
          if s3.last
            r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
            r3.extend(VerbatimText0)
          else
            @index = i3
            r3 = nil
          end
          if r3
            r2 = nil
          else
            @index = i2
            r2 = instantiate_node(SyntaxNode,input, index...index)
          end
          s1 << r2
          if r2
            if index < input_length
              r7 = instantiate_node(SyntaxNode,input, index...(index + 1))
              @index += 1
            else
              terminal_parse_failure("any character")
              r7 = nil
            end
            s1 << r7
          end
          if s1.last
            r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
            r1.extend(VerbatimText1)
          else
            @index = i1
            r1 = nil
          end
          if r1
            s0 << r1
          else
            break
          end
        end
        if s0.empty?
          @index = i0
          r0 = nil
        else
          r0 = instantiate_node(TextNode,input, i0...index, s0)
        end

        node_cache[:verbatim_text][start_index] = r0

        r0
      end

    end

    class VerbatimParser < Treetop::Runtime::CompiledParser
      include Verbatim
    end

  end
end
