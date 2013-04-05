# Autogenerated from a Treetop grammar. Edits may be lost.


require "hemingway/tag/tag_nodes"

module Hemingway
  module Tag
    include Treetop::Runtime

    def root
      @root ||= :tag
    end

    module Tag0
      def tag_start
        elements[0]
      end

      def tag_type
        elements[1]
      end

      def sequence
        elements[3]
      end

    end

    module Tag1
      def tag_start
        elements[0]
      end

      def vertical_space
        elements[1]
      end

      def vertical_height
        elements[3]
      end

    end

    module Tag2
      def content
        elements[1]
      end
    end

    module Tag3
      def tag_start
        elements[0]
      end

      def hfill
        elements[1]
      end

      def spaces
        elements[2]
      end

      def sequence
        elements[3]
      end
    end

    module Tag4
      def tag_start
        elements[0]
      end

      def neatline
        elements[1]
      end
    end

    module Tag5
      def tag_start
        elements[0]
      end

      def accent
        elements[1]
      end

      def character
        elements[3]
      end

    end

    def _nt_tag
      start_index = index
      if node_cache[:tag].has_key?(index)
        cached = node_cache[:tag][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0 = index
      i1, s1 = index, []
      r2 = _nt_tag_start
      s1 << r2
      if r2
        r3 = _nt_tag_type
        s1 << r3
        if r3
          if has_terminal?("{", false, index)
            r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure("{")
            r4 = nil
          end
          s1 << r4
          if r4
            s5, i5 = [], index
            loop do
              r6 = _nt_content
              if r6
                s5 << r6
              else
                break
              end
            end
            r5 = instantiate_node(SyntaxNode,input, i5...index, s5)
            s1 << r5
            if r5
              if has_terminal?("}", false, index)
                r7 = instantiate_node(SyntaxNode,input, index...(index + 1))
                @index += 1
              else
                terminal_parse_failure("}")
                r7 = nil
              end
              s1 << r7
            end
          end
        end
      end
      if s1.last
        r1 = instantiate_node(TagNode,input, i1...index, s1)
        r1.extend(Tag0)
      else
        @index = i1
        r1 = nil
      end
      if r1
        r0 = r1
      else
        i8, s8 = index, []
        r9 = _nt_tag_start
        s8 << r9
        if r9
          r10 = _nt_vertical_space
          s8 << r10
          if r10
            if has_terminal?("{", false, index)
              r11 = instantiate_node(SyntaxNode,input, index...(index + 1))
              @index += 1
            else
              terminal_parse_failure("{")
              r11 = nil
            end
            s8 << r11
            if r11
              r12 = _nt_vertical_height
              s8 << r12
              if r12
                if has_terminal?("}", false, index)
                  r13 = instantiate_node(SyntaxNode,input, index...(index + 1))
                  @index += 1
                else
                  terminal_parse_failure("}")
                  r13 = nil
                end
                s8 << r13
              end
            end
          end
        end
        if s8.last
          r8 = instantiate_node(VerticalSpaceTagNode,input, i8...index, s8)
          r8.extend(Tag1)
        else
          @index = i8
          r8 = nil
        end
        if r8
          r0 = r8
        else
          i14, s14 = index, []
          r15 = _nt_tag_start
          s14 << r15
          if r15
            r16 = _nt_hfill
            s14 << r16
            if r16
              r17 = _nt_spaces
              s14 << r17
              if r17
                s18, i18 = [], index
                loop do
                  i19, s19 = index, []
                  i20 = index
                  r21 = _nt_newline
                  if r21
                    r20 = nil
                  else
                    @index = i20
                    r20 = instantiate_node(SyntaxNode,input, index...index)
                  end
                  s19 << r20
                  if r20
                    r22 = _nt_content
                    s19 << r22
                  end
                  if s19.last
                    r19 = instantiate_node(SyntaxNode,input, i19...index, s19)
                    r19.extend(Tag2)
                  else
                    @index = i19
                    r19 = nil
                  end
                  if r19
                    s18 << r19
                  else
                    break
                  end
                end
                r18 = instantiate_node(SyntaxNode,input, i18...index, s18)
                s14 << r18
              end
            end
          end
          if s14.last
            r14 = instantiate_node(HFillNode,input, i14...index, s14)
            r14.extend(Tag3)
          else
            @index = i14
            r14 = nil
          end
          if r14
            r0 = r14
          else
            i23, s23 = index, []
            r24 = _nt_tag_start
            s23 << r24
            if r24
              r25 = _nt_neatline
              s23 << r25
            end
            if s23.last
              r23 = instantiate_node(NeatLineNode,input, i23...index, s23)
              r23.extend(Tag4)
            else
              @index = i23
              r23 = nil
            end
            if r23
              r0 = r23
            else
              i26, s26 = index, []
              r27 = _nt_tag_start
              s26 << r27
              if r27
                r28 = _nt_accent
                s26 << r28
                if r28
                  if has_terminal?("{", false, index)
                    r29 = instantiate_node(SyntaxNode,input, index...(index + 1))
                    @index += 1
                  else
                    terminal_parse_failure("{")
                    r29 = nil
                  end
                  s26 << r29
                  if r29
                    if index < input_length
                      r30 = instantiate_node(SyntaxNode,input, index...(index + 1))
                      @index += 1
                    else
                      terminal_parse_failure("any character")
                      r30 = nil
                    end
                    s26 << r30
                    if r30
                      if has_terminal?("}", false, index)
                        r31 = instantiate_node(SyntaxNode,input, index...(index + 1))
                        @index += 1
                      else
                        terminal_parse_failure("}")
                        r31 = nil
                      end
                      s26 << r31
                    end
                  end
                end
              end
              if s26.last
                r26 = instantiate_node(AccentNode,input, i26...index, s26)
                r26.extend(Tag5)
              else
                @index = i26
                r26 = nil
              end
              if r26
                r0 = r26
              else
                @index = i0
                r0 = nil
              end
            end
          end
        end
      end

      node_cache[:tag][start_index] = r0

      r0
    end

    def _nt_tag_type
      start_index = index
      if node_cache[:tag_type].has_key?(index)
        cached = node_cache[:tag_type][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0 = index
      if has_terminal?("emph", false, index)
        r1 = instantiate_node(EmphTagNode,input, index...(index + 4))
        @index += 4
      else
        terminal_parse_failure("emph")
        r1 = nil
      end
      if r1
        r0 = r1
      else
        if has_terminal?("texttt", false, index)
          r2 = instantiate_node(TextttTagNode,input, index...(index + 6))
          @index += 6
        else
          terminal_parse_failure("texttt")
          r2 = nil
        end
        if r2
          r0 = r2
        else
          if has_terminal?("textbf", false, index)
            r3 = instantiate_node(TextbfTagNode,input, index...(index + 6))
            @index += 6
          else
            terminal_parse_failure("textbf")
            r3 = nil
          end
          if r3
            r0 = r3
          else
            if has_terminal?("textsc", false, index)
              r4 = instantiate_node(TextscTagNode,input, index...(index + 6))
              @index += 6
            else
              terminal_parse_failure("textsc")
              r4 = nil
            end
            if r4
              r0 = r4
            else
              @index = i0
              r0 = nil
            end
          end
        end
      end

      node_cache[:tag_type][start_index] = r0

      r0
    end

    def _nt_vertical_space
      start_index = index
      if node_cache[:vertical_space].has_key?(index)
        cached = node_cache[:vertical_space][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      if has_terminal?("vspace", false, index)
        r0 = instantiate_node(SyntaxNode,input, index...(index + 6))
        @index += 6
      else
        terminal_parse_failure("vspace")
        r0 = nil
      end

      node_cache[:vertical_space][start_index] = r0

      r0
    end

    module VerticalHeight0
      def height
        elements[0]
      end

      def millimeter
        elements[1]
      end
    end

    def _nt_vertical_height
      start_index = index
      if node_cache[:vertical_height].has_key?(index)
        cached = node_cache[:vertical_height][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      s1, i1 = [], index
      loop do
        if has_terminal?('\G[0-9]', true, index)
          r2 = true
          @index += 1
        else
          r2 = nil
        end
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
        r3 = _nt_millimeter
        s0 << r3
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(VerticalHeight0)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:vertical_height][start_index] = r0

      r0
    end

    def _nt_millimeter
      start_index = index
      if node_cache[:millimeter].has_key?(index)
        cached = node_cache[:millimeter][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      if has_terminal?("mm", false, index)
        r0 = instantiate_node(SyntaxNode,input, index...(index + 2))
        @index += 2
      else
        terminal_parse_failure("mm")
        r0 = nil
      end

      node_cache[:millimeter][start_index] = r0

      r0
    end

    def _nt_hfill
      start_index = index
      if node_cache[:hfill].has_key?(index)
        cached = node_cache[:hfill][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      if has_terminal?("hfill", false, index)
        r0 = instantiate_node(SyntaxNode,input, index...(index + 5))
        @index += 5
      else
        terminal_parse_failure("hfill")
        r0 = nil
      end

      node_cache[:hfill][start_index] = r0

      r0
    end

    def _nt_neatline
      start_index = index
      if node_cache[:neatline].has_key?(index)
        cached = node_cache[:neatline][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      if has_terminal?("neatline", false, index)
        r0 = instantiate_node(SyntaxNode,input, index...(index + 8))
        @index += 8
      else
        terminal_parse_failure("neatline")
        r0 = nil
      end

      node_cache[:neatline][start_index] = r0

      r0
    end

    def _nt_accent
      start_index = index
      if node_cache[:accent].has_key?(index)
        cached = node_cache[:accent][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0 = index
      if has_terminal?('`', false, index)
        r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure('`')
        r1 = nil
      end
      if r1
        r0 = r1
      else
        if has_terminal?("'", false, index)
          r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure("'")
          r2 = nil
        end
        if r2
          r0 = r2
        else
          if has_terminal?('^', false, index)
            r3 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure('^')
            r3 = nil
          end
          if r3
            r0 = r3
          else
            if has_terminal?('"', false, index)
              r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
              @index += 1
            else
              terminal_parse_failure('"')
              r4 = nil
            end
            if r4
              r0 = r4
            else
              if has_terminal?("c", false, index)
                r5 = instantiate_node(SyntaxNode,input, index...(index + 1))
                @index += 1
              else
                terminal_parse_failure("c")
                r5 = nil
              end
              if r5
                r0 = r5
              else
                if has_terminal?("~", false, index)
                  r6 = instantiate_node(SyntaxNode,input, index...(index + 1))
                  @index += 1
                else
                  terminal_parse_failure("~")
                  r6 = nil
                end
                if r6
                  r0 = r6
                else
                  if has_terminal?("r", false, index)
                    r7 = instantiate_node(SyntaxNode,input, index...(index + 1))
                    @index += 1
                  else
                    terminal_parse_failure("r")
                    r7 = nil
                  end
                  if r7
                    r0 = r7
                  else
                    @index = i0
                    r0 = nil
                  end
                end
              end
            end
          end
        end
      end

      node_cache[:accent][start_index] = r0

      r0
    end

    def _nt_tag_start
      start_index = index
      if node_cache[:tag_start].has_key?(index)
        cached = node_cache[:tag_start][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      if has_terminal?("\\", false, index)
        r0 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure("\\")
        r0 = nil
      end

      node_cache[:tag_start][start_index] = r0

      r0
    end

    def _nt_tag_end
      start_index = index
      if node_cache[:tag_end].has_key?(index)
        cached = node_cache[:tag_end][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      if has_terminal?("}", false, index)
        r0 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure("}")
        r0 = nil
      end

      node_cache[:tag_end][start_index] = r0

      r0
    end

  end

  class TagParser < Treetop::Runtime::CompiledParser
    include Tag
  end

end