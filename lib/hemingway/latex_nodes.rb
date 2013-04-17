module Hemingway

  module EntryNode
    def html
      footnote_content = []
      paragraph_html = ""

      elements.each do |e|
        # Time.now.to_f => 123123.1231231
        time = Time.now.to_f.to_s.gsub(".", ":")
        paragraph_html += e.html(footnote_content.size, time)
        footnote_content += e.footnote_html(footnote_content.size, time)
      end

      footnote_html = footnote_content.join

      Build.tag("div", paragraph_html + footnote_html, :class => "entry")
    end
  end

  module ParagraphNode

    # I'm passing in a time variable here to make links unique. You see,
    # if you parse many of these entries on a single HTML page you'll end up
    # with multiple #footnote1 divs. To make them unique, we'll pass down
    # a time variable from above to seed them.
    def html(footnote_seed, time)
      paragraph_content = sequence.elements.map do |element|
        if element.respond_to?(:footnote_html)
          footnote_seed += 1
          element.html(footnote_seed, time)
        elsif element.respond_to?(:newline)
          element.newline.html
        else
          element.html
        end
      end.join

      Build.tag("p", paragraph_content)
    end

    # I'm passing in a time variable here to make links unique. You see,
    # if you parse many of these entries on a single HTML page you'll end up
    # with multiple #footnote1 divs. To make them unique, we'll pass down
    # a time variable from above to seed them.
    def footnote_html(footnote_seed, time)
      footnote_content = sequence.elements.reduce([]) do |memo, element|
        if element.respond_to?(:footnote_html)
          footnote_seed += 1
          memo + [element.footnote_html(footnote_seed, time)]
        else
          memo
        end
      end
    end
  end

  module NewlineNode
    def html
    end

    def visible_html
      "\n"
    end
  end

  module WhitespaceNode
    def html
    end
  end

end