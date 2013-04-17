module Hemingway

	module MDashNode
		def html
			"&mdash;"
		end
	end

	module LeftQuoteNode
		def html
			"&#8220;"
		end
	end

	module RightQuoteNode
		def html
			"&#8221;"
		end
	end

end