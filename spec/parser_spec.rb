require 'spec_helper'

module Hemingway

  describe LatexParser do

    before do
      @parser = LatexParser.new
    end

    describe "#basics" do

      it 'should create a paragraph inside a entry div' do
        html = @parser.parse("hello").html
        html.should == "<div class='entry'><p>hello</p></div>"
      end

      it 'should allow me to newline the hell out of a file (\n invariant)' do
        html = @parser.parse("\\emph{hey}\n\n\n\n\n\n").html
        html.should == "<div class='entry'><p><em>hey</em></p></div>"
      end

      it 'should create a new paragraph when two newlines are encountered' do
        html = @parser.parse("para 1\n\npara 2").html
        html.should == "<div class='entry'><p>para 1</p><p>para 2</p></div>"
      end

      it 'should create a new paragraph when more than two newlines are encountered' do
        html = @parser.parse("para 1\n\n\n\n\n\n\npara 2").html
        html.should == "<div class='entry'><p>para 1</p><p>para 2</p></div>"
      end

      it 'should create an empty div with the empty string' do
        html = @parser.parse("").html
        html.should == "<div class='entry'></div>"
      end

      it 'should be cool with an empty tag' do
        html = @parser.parse("\\emph{}").html
        html.should == "<div class='entry'><p><em></em></p></div>"
      end

    end


  end

end