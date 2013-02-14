module Hemingway
  module DocumentNode
    def html
      paragraphs = elements
      Build.tag("div", paragraphs.map { |e| e.html }.join, :class => "document")
    end
  end

  module ParagraphNode
    def html
      # As we iterate through the paragraph elements, we need to keep 
      # track of how many footnotes we've created.
      footnote_number = 0
      footnote_content = ""

      paragraph_content = sequence.elements.map do |element|
        if element.respond_to?(:footnote_html)
          footnote_number += 1
          footnote_content += element.footnote_html(footnote_number)
          element.html(footnote_number)
        else
          element.html
        end
      end.join

      Build.tag("p", paragraph_content) + footnote_content
    end
  end
end