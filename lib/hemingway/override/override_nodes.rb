module Hemingway

	module MDashNode
		def html
			"&mdash;"
		end
	end

	module LeftDoubleQuoteNode
		def html
			"&#8220;"
		end
	end

	module RightDoubleQuoteNode
		def html
			"&#8221;"
		end
	end

	module LeftSingleQuoteNode
		def html
			"&#8216;"
		end
	end

	module RightSingleQuoteNode
		def html
			"&#8217;"
		end
	end

end