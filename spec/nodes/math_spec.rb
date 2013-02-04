require 'spec_helper'

module Hemingway

  describe LatexParser do

    before do
      @parser = Parser.new
    end 

    describe "#math" do
      it 'should parse out a math symbol' do
        html = @parser.parse("$\\Delta$").html
        html.should == "<div class='document'><p>&Delta;</p></div>"
      end

      it 'should allow me to nest math symbols in a tag' do
        html = @parser.parse("\\emph{$\\Delta$}").html
        html.should == "<div class='document'><p><em>&Delta;</em></p></div>"
      end

      it 'should escape text properly into a math symbol' do
        html = @parser.parse("hello $\\Delta$").html
        html.should == "<div class='document'><p>hello &Delta;</p></div>"
      end

    end
    
  end

end