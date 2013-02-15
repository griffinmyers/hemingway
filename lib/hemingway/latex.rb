module Hemingway

  module EntryNode
    def html
      footnote_number = 0
      footnote_content = []
      paragraph_html = ""

      elements.each do |e|
        paragraph_html += e.html(footnote_number)
        footnote_content += e.footnote_html(footnote_number)
        footnote_number = footnote_content.size
      end

      footnote_html = footnote_content.join

      Build.tag("div", paragraph_html + footnote_html, :class => "entry")
    end
  end

  module ParagraphNode
    def html(footnote_number)
      paragraph_content = sequence.elements.map do |element|
        if element.respond_to?(:footnote_html)
          footnote_number += 1
          element.html(footnote_number)
        else
          element.html
        end
      end.join

      Build.tag("p", paragraph_content)
    end

    def footnote_html(footnote_number)
      footnote_content = sequence.elements.reduce([]) do |memo, element|
        if element.respond_to?(:footnote_html)
          footnote_number += 1
          memo + [element.footnote_html(footnote_number)]
        else
          memo
        end
      end
    end

  end
end