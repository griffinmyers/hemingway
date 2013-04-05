module Hemingway
  module TagNode
    def html
      tag_type.html(sequence.elements.map { |c| c.html }.join)
    end
  end

  module VerticalSpaceTagNode
    def html
      Build.tag("div", nil, :class => "vspace#{vertical_height.height.text_value}")
    end
  end

  module HFillNode
    def html
      Build.tag("span", sequence.elements.map { |c| c.content.html }.join, :class => "pull-right")
    end
  end

  module NeatLineNode
    def html
      Build.tag("hr", nil, :class => "neatline", :close_tag => false)
    end
  end

  module EmphTagNode
    def html(content)
      Build.tag("em", content)
    end
  end

  module TextttTagNode
    def html(content)
      Build.tag("code", content)
    end
  end

  module TextbfTagNode
    def html(content)
      Build.tag("strong", content)
    end
  end

  module TextscTagNode
    def html(content)
      Build.tag("span", content, :class => "textsc")
    end
  end

  module AccentNode
    def html
      Build.accent(character.text_value, accent.text_value)
    end
  end
end