require 'spec_helper'

module Hemingway

  describe LatexParser do

    before do
      @parser = LatexParser.new
    end

    describe "#verbatim" do

      it 'allows me to instantiate pre-formatted text' do
        html = @parser.parse("\\begin{verbatim} don't  we  \n \n all wish \n \n   for a little sleep? \\end{verbatim}").html
        html.should == "<div class='entry'><p><pre>don't  we  \n \n all wish \n \n   for a little sleep? </pre></p></div>"
      end

      it 'allows me to write tex markup that isnt parses' do
        html = @parser.parse("\\begin{verbatim} Emphasized text uses the \\emph{} tag. \\end{verbatim}").html
        html.should == "<div class='entry'><p><pre>Emphasized text uses the \\emph{} tag. </pre></p></div>"
      end

    end

  end
end

