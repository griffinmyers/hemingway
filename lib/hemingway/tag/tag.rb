module Hemingway
  module TagNode
    def html
      tag_type.html(sequence.elements.map { |c| c.html }.join)
    end 
  end

  module VerticalSpaceTagNode
    def html
      Build.tag("div", "", "vspace#{vertical_height.height.text_value}")
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
      Build.tag("span", content, "textsc")
    end
  end
end