# Autogenerated from a Treetop grammar. Edits may be lost.


require "hemingway/block/quote/quote_nodes"

module Hemingway
  module Block
    module Quote
      include Treetop::Runtime

      def root
        @root ||= :quote_type
      end

      def _nt_quote_type
        start_index = index
        if node_cache[:quote_type].has_key?(index)
          cached = node_cache[:quote_type][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        if has_terminal?("quote", false, index)
          r0 = instantiate_node(QuoteNode,input, index...(index + 5))
          @index += 5
        else
          terminal_parse_failure("quote")
          r0 = nil
        end

        node_cache[:quote_type][start_index] = r0

        r0
      end

      def _nt_quote_entry
        start_index = index
        if node_cache[:quote_entry].has_key?(index)
          cached = node_cache[:quote_entry][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        s0, i0 = [], index
        loop do
          i1 = index
          r2 = _nt_quote_paragraph
          if r2
            r1 = r2
          else
            r3 = _nt_quote_last_paragraph
            if r3
              r1 = r3
            else
              @index = i1
              r1 = nil
            end
          end
          if r1
            s0 << r1
          else
            break
          end
        end
        r0 = instantiate_node(QuoteEntryNode,input, i0...index, s0)

        node_cache[:quote_entry][start_index] = r0

        r0
      end

      module QuoteParagraph0
        def sequence
          elements[0]
        end

        def eop
          elements[1]
        end
      end

      def _nt_quote_paragraph
        start_index = index
        if node_cache[:quote_paragraph].has_key?(index)
          cached = node_cache[:quote_paragraph][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        i0, s0 = index, []
        s1, i1 = [], index
        loop do
          r2 = _nt_content
          if r2
            s1 << r2
          else
            break
          end
        end
        r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
        s0 << r1
        if r1
          r3 = _nt_eop
          s0 << r3
        end
        if s0.last
          r0 = instantiate_node(QuoteParagraphNode,input, i0...index, s0)
          r0.extend(QuoteParagraph0)
        else
          @index = i0
          r0 = nil
        end

        node_cache[:quote_paragraph][start_index] = r0

        r0
      end

      module QuoteLastParagraph0
        def sequence
          elements[0]
        end

      end

      def _nt_quote_last_paragraph
        start_index = index
        if node_cache[:quote_last_paragraph].has_key?(index)
          cached = node_cache[:quote_last_paragraph][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        i0, s0 = index, []
        s1, i1 = [], index
        loop do
          r2 = _nt_content
          if r2
            s1 << r2
          else
            break
          end
        end
        if s1.empty?
          @index = i1
          r1 = nil
        else
          r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
        end
        s0 << r1
        if r1
          r4 = _nt_eop
          if r4
            r3 = r4
          else
            r3 = instantiate_node(SyntaxNode,input, index...index)
          end
          s0 << r3
        end
        if s0.last
          r0 = instantiate_node(QuoteParagraphNode,input, i0...index, s0)
          r0.extend(QuoteLastParagraph0)
        else
          @index = i0
          r0 = nil
        end

        node_cache[:quote_last_paragraph][start_index] = r0

        r0
      end

    end

    class QuoteParser < Treetop::Runtime::CompiledParser
      include Quote
    end

  end
end