module Hemingway

  module MathNode
    def html
      content.html
    end
  end

  module ExponentNode
  	def html
  		Build.tag("sup", text.html)
  	end
	end

end
