require "treetop"
require "hemingway/latex"

module Hemingway
	# This aliases the LatexParser that treetop generates as Parser
	Parser = LatexParser
end