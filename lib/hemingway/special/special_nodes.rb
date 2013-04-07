module Hemingway
	module SpecialNode
		def html
			if character.text_value == "textbackslash{}"
				"\\"
			else
				character.text_value
			end
		end
	end
end