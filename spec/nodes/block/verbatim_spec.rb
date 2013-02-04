require 'spec_helper'

module Hemingway

  describe LatexParser do

    before do
      @parser = Parser.new
    end 

    describe "#verbatim" do

      it 'allows me to instantiate pre-formatted text' do
        html = @parser.parse("\\begin{verbatim} don't  we  \n \n all wish \n \n   for a little sleep? \\end{verbatim}").html
        html.should == "<div class='document'><p><pre>don't  we  \n \n all wish \n \n   for a little sleep? </pre></p></div>"
      end

    end

  end
end

