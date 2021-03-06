require 'spec_helper'

module Hemingway

  describe Parser do

    before do
      @parser = Parser.new
    end

    describe "#tag" do

      it 'should parse an emph tag' do
        html = @parser.parse("a \\emph{hey} b").html
        html.should == "<div class='entry'><p>a <em>hey</em> b</p></div>"
      end

      it 'should parse a texttt tag' do
        html = @parser.parse("\\texttt{hey}").html
        html.should == "<div class='entry'><p><code>hey</code></p></div>"
      end

      it 'should parse a textbf tag' do
        html = @parser.parse("\\textbf{hey}").html
        html.should == "<div class='entry'><p><strong>hey</strong></p></div>"
      end

      it 'should parse a textsc tag' do
        html = @parser.parse("\\textsc{hey}").html
        html.should == "<div class='entry'><p><span class='textsc'>hey</span></p></div>"
      end

      it 'should allow sequences of content within a tag' do
        html = @parser.parse("\\textsc{hey \\emph{vibes} \& times}").html
        html.should == "<div class='entry'><p><span class='textsc'>hey <em>vibes</em> & times</span></p></div>"
      end

    end

    describe "#nesting" do

      it 'should allow me to nest tags' do
        html = @parser.parse("\\emph{\\texttt{hey}}").html
        html.should == "<div class='entry'><p><em><code>hey</code></em></p></div>"
      end

      it 'should REALLY allow me to next tags' do
        html = @parser.parse("\\emph{\\texttt{\\texttt{hey}}}").html
        html.should == "<div class='entry'><p><em><code><code>hey</code></code></em></p></div>"
      end

      it 'should escape special characters in a tag' do
        html = @parser.parse("\\emph{War \\& Peace}").html
        html.should == "<div class='entry'><p><em>War & Peace</em></p></div>"
      end

    end

    describe "#vspace" do

      it 'should build vertical space taking divs' do
        html = @parser.parse("\\vspace{5mm}").html
        html.should == "<div class='entry'><p><div class='vspace5'></div></p></div>"
      end

      it 'should build vertical space taking divs with double digit heights' do
        html = @parser.parse("\\vspace{12mm}").html
        html.should == "<div class='entry'><p><div class='vspace12'></div></p></div>"
      end

    end

    describe '#hfill' do

      it 'supports right justifying on a line' do
        html = @parser.parse("The love, \\hfill Will").html
        html.should == "<div class='entry'><p>The love, <span class='pull-right'>Will</span></p></div>"
      end

      it 'allows me to put all the good shit in' do
        html = @parser.parse("The love, \\hfill \\emph{Will} \\textsc{Tha Thrill} $\\delta$ \\textbf{Myers}").html
        html.should == "<div class='entry'><p>The love, <span class='pull-right'><em>Will</em> <span class='textsc'>Tha Thrill</span> &delta; <strong>Myers</strong></span></p></div>"
      end

    end

    describe '#neatline' do

      it 'allows me to add fancy <hr>s to a page' do
        html = @parser.parse("\\neatline").html
        html.should == "<div class='entry'><p><hr class='neatline'></p></div>"
      end

    end

    describe "#accents" do

      it 'allows me to put accents inline with text' do
        html = @parser.parse("Charm\\'{e}e de vous voir. Je suis tr\\`{e} contente de vous voir.").html
        html.should == "<div class='entry'><p>Charm&eacute;e de vous voir. Je suis tr&egrave; contente de vous voir.</p></div>"
      end

    end

  end

end