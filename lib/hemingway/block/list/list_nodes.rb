module Hemingway 

  module ItemizeListNode
    def html(block_content)
      Build.tag("ul", block_content.elements.map { |e| e.list_html }.join)
    end
  end

  module EnumerateListNode
    def html(block_content)
      Build.tag("ol", block_content.elements.map { |e| e.list_html }.join)
    end
  end

  module DescriptionListNode
    def html(block_content)
      Build.tag("dl", block_content.elements.map { |e| e.description_html }.join)
    end
  end

  module ItemNode
    def list_html
      label_tag = label.empty? ? "" : Build.tag("span", label.html, :class => "list-label")
      Build.tag("li", label_tag + sequence.elements.map { |e| e.html }.join)
    end

    def description_html
      label_tag = label.empty? ? "" : Build.tag("dt", label.html)
      Build.tag("dd", label_tag + sequence.elements.map { |e| e.html }.join)
    end
  end

  module LabelNode
    def html
      sequence.elements.map { |e| e.html }.join
    end
  end

end