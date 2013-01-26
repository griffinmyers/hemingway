require "hemingway/parser"
require 'pry-debugger'

module Hemingway

  def self.ff
    source = ""
    File.open("simple.tex", "r") do |infile|
      while (line = infile.gets)
        source << line
      end
    end

    parser = Parser.new
    p = parser.parse(source)
    p.html
  end

end
