require 'pry'

module Hemingway

  module EntryNode
    def html
      footnote_content = []
      paragraph_html = ""

      elements.each do |e|
        paragraph_html += e.html(footnote_content.size)
        footnote_content += e.footnote_html(footnote_content.size)
      end

      footnote_html = footnote_content.join

      Build.tag("div", paragraph_html + footnote_html, :class => "entry")
    end
  end

  module ParagraphNode
    def html(footnote_seed)
      paragraph_content = sequence.elements.map do |element|
        if element.respond_to?(:footnote_html)
          footnote_seed += 1
          element.html(footnote_seed)
        elsif element.respond_to?(:newline)
          element.newline.html
        else
          element.html
        end
      end.join

      Build.tag("p", paragraph_content)
    end

    def footnote_html(footnote_seed)
      footnote_content = sequence.elements.reduce([]) do |memo, element|
        if element.respond_to?(:footnote_html)
          footnote_seed += 1
          memo + [element.footnote_html(footnote_seed)]
        else
          memo
        end
      end
    end
  end

  module NewlineNode
    def html
    end
  end

end