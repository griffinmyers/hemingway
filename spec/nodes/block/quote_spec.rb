require 'spec_helper'

module Hemingway

  describe Parser do

    before do
      @parser = Parser.new
    end

    describe "#quote" do

      it 'parses simple block quotes' do
        html = @parser.parse("\\begin{quote}\nHave you guys ever heard the song \\emph{Blow} by \\emph{MILF}?\n\\end{quote}").html
        html.should == "<div class='entry'><p><blockquote><p>Have you guys ever heard the song <em>Blow</em> by <em>MILF</em>?</p></blockquote></p></div>"
      end

      it 'parses multi-paragraph block quotes' do
        html = @parser.parse("\\begin{quote}\n We really ought to listen to The Smiths more. \n\n Melancholy can be a good thing. \n\\end{quote}").html
        html.should == "<div class='entry'><p><blockquote><p>We really ought to listen to The Smiths more. </p><p> Melancholy can be a good thing. </p></blockquote></p></div>"
      end

      it 'doesnt support footnotes' do
        @parser.parse("\\begin{quote}\n T-Rex\\footnote{King of the Dinos} \n\\end{quote}").should be_nil
      end

    end

  end

end
