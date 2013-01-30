module Hemingway
  module DocumentNode
    def html
      paragraphs = elements
      Build.tag("div", paragraphs.map { |e| e.html }.join, "document")
    end
  end

  module ParagraphNode
    def html
      Build.tag("p", sequence.elements.map { |c| c.html }.join)
    end
  end
end