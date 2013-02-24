require "treetop"
require "polyglot"
require "hemingway/latex.treetop"

module Hemingway

  # This class is a thin wrapper around the LatexParser built by Treetop
  # At first I used this to pad input, but as it currently stands it serves
  # no purpose. I'm leaving the infrastructure in-tact for the moment
  # incase it occurs to me that some method would be nice to have on it.
  class Parser

    def initialize
      @latex_parser = LatexParser.new
    end

    def method_missing(method, *args, &block)
      @latex_parser.send(method, *args, &block)
    end

  end

end