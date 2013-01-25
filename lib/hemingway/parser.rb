require "treetop"
require "polyglot"
require "hemingway/latex.treetop"

module Hemingway

  # This class is a thin wrapper around the LatexParser built by Treetop
  class Parser

    def initialize
      @latex_parser = LatexParser.new
    end

    def parse(input, options={})
      @latex_parser.parse(pad(input), options)
    end

    def method_missing(method, *args, &block)
      @latex_parser.send(method, *args, &block)
    end

    private 
    # This method pads input with two extra newline characters. The parser
    # relies on file terminating with two or more newlines, so this just
    # enforces that any input abides by this stipulation. 
    def pad(input)
      input + "\n\n"
    end

  end

end