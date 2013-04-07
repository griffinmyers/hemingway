module Hemingway

  module CenterNode
    def html(block_content)
      content = block_content.elements.map do |e|
        if e.respond_to?(:content)
          e.content.html
        else
          e.visible_html
        end
      end.join

      Build.tag("div", content , class: "center")
    end
  end

end