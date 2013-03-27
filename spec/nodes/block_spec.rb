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

       it "should allow me to put blocks right after text and a newline" do
        html = @parser.parse("check out this f*ckin block:\n\\begin{itemize} \\item hey \\end{itemize}").html
        html.should == "<div class='entry'><p>check out this f*ckin block:<ul><li>hey </li></ul></p></div>"
      end

    end

  end
end

