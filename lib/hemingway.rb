require "treetop"
require "polyglot"
require "hemingway/latex.treetop"
require 'pry-debugger'

module Hemingway

  def self.ff
    source = ""
    File.open("simple.tex", "r") do |infile|
      while (line = infile.gets)
        source << line
      end
    end

    parser = LatexParser.new
    p = parser.parse(source)
    binding.pry
    p.html
  end

end
