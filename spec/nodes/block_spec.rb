require 'spec_helper'

module Hemingway

  describe Parser do

    before do
      @parser = Parser.new
    end

    describe "#block" do

      it "should only parse blocks with matching begin and end tags" do
        @parser.parse("\\begin{itemize} \\item hey \\end{description}").should be_nil
      end

    end

  end
end

