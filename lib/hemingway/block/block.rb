module Hemingway
  module ItemizeBlockNode
    def html
      Build.tag("ul", itemize_content.elements.map { |e| e.html }.join)
    end
  end

  module ItemNode
    def html
      label_tag = label.empty? ? "" : Build.tag("span", label.html, "label")
      Build.tag("li", label_tag + sequence.elements.map { |e| e.html }.join)
    end
  end

  module LabelNode
    def html
      label_content.html
    end
  end
end