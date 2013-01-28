require 'spec_helper'

module Hemingway

  describe LatexParser do

    before do
      @parser = Parser.new
    end 

    describe "#basics" do

      it 'should create a paragraph inside a document div' do
        html = @parser.parse("hello").html 
        html.should == "<div class='document'><p>hello</p></div>"
      end

      it 'should allow me to newline the hell out of a file (\n invariant)' do
        html = @parser.parse("\\emph{hey}\n\n\n\n\n\n").html 
        html.should == "<div class='document'><p><em>hey</em></p></div>"
      end

      it 'should create a new paragraph when two newlines are encountered' do
        html = @parser.parse("para 1\n\npara 2").html 
        html.should == "<div class='document'><p>para 1</p><p>para 2</p></div>"
      end

      it 'should create a new paragraph when more than two newlines are encountered' do
        html = @parser.parse("para 1\n\n\n\n\n\n\npara 2").html 
        html.should == "<div class='document'><p>para 1</p><p>para 2</p></div>"
      end

      it 'should create an empty p within a document div with the empty string' do
        html = @parser.parse("").html 
        html.should == "<div class='document'><p></p></div>"
      end

      it 'should be cool with an empty tag' do
        html = @parser.parse("\\emph{}").html
        html.should == "<div class='document'><p><em></em></p></div>"
      end

    end

    describe "#special" do

      it 'should escape a special character' do
        html = @parser.parse("War \\& Peace").html
        html.should == "<div class='document'><p>War & Peace</p></div>"
      end

      it 'should allow for special chars and tags in sequence' do
        html = @parser.parse("War \\& Peace \\textbf{Tolstoy} \\#").html
        html.should == "<div class='document'><p>War & Peace <strong>Tolstoy</strong> #</p></div>"
      end

    end

    describe "#tag" do

      it 'should parse an emph tag' do
        html = @parser.parse("a \\emph{hey} b").html 
        html.should == "<div class='document'><p>a <em>hey</em> b</p></div>"
      end

      it 'should parse a texttt tag' do
        html = @parser.parse("\\texttt{hey}").html 
        html.should == "<div class='document'><p><code>hey</code></p></div>"
      end

      it 'should parse a textbf tag' do
        html = @parser.parse("\\textbf{hey}").html 
        html.should == "<div class='document'><p><strong>hey</strong></p></div>"
      end

      it 'should parse a textsc tag' do
        html = @parser.parse("\\textsc{hey}").html 
        html.should == "<div class='document'><p><span class='textsc'>hey</span></p></div>"
      end

      it 'should allow sequences of content within a tag' do
        html = @parser.parse("\\textsc{hey \\emph{vibes} \& times}").html 
        html.should == "<div class='document'><p><span class='textsc'>hey <em>vibes</em> & times</span></p></div>"
      end

    end

    describe "#nesting" do

      it 'should allow me to nest tags' do
        html = @parser.parse("\\emph{\\texttt{hey}}").html 
        html.should == "<div class='document'><p><em><code>hey</code></em></p></div>"
      end

      it 'should REALLY allow me to next tags' do
        html = @parser.parse("\\emph{\\texttt{\\texttt{hey}}}").html 
        html.should == "<div class='document'><p><em><code><code>hey</code></code></em></p></div>"
      end

      it 'should escape special characters in a tag' do
        html = @parser.parse("\\emph{War \\& Peace}").html
        html.should == "<div class='document'><p><em>War & Peace</em></p></div>"
      end
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