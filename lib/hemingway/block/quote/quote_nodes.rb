module Hemingway

  module QuoteNode
    def html(block_content)
      Build.tag("blockquote", block_content.html)
    end
  end

  module QuoteEntryNode
    def html
      elements.map { |e| e.html }.join
    end
  end

  module QuoteParagraphNode
    def html
      paragraph_content = sequence.elements.map do |element|
        element.html
      end.join

      Build.tag("p", paragraph_content)
    end
  end

end