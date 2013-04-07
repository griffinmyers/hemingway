module Hemingway
  module MathNode
    def html
      content.html
    end
  end

  module ExponentNode
  	def html
      # Pretty bad hack, but I figure it ain't a big deal until I want to
      # support more rebust syntax.
      if value.text_value == "\\circ"
        "&deg;"
      else
        Build.tag("sup", value.html)
      end
    end
  end

end
