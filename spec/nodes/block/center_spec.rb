require 'spec_helper'

module Hemingway

  describe Parser do

    before do
      @parser = Parser.new
    end

    describe "#center" do

      it 'centers text' do
        html = @parser.parse("\\begin{center} So show my why you're strong. \n\n Ignore everybody else \n\n We're alone now \\end{center}").html
        html.should == "<div class='entry'><p><div class='center'>So show my why you're strong. \n\n Ignore everybody else \n\n We're alone now </div></p></div>"
      end

      it 'centers content too' do
        html = @parser.parse("The New James Blake: \\begin{center} So show my why you're \\emph{strong}. \n\n Ignore \\textsc{everybody} else \n\n We're alone now \\end{center}").html
        html.should == "<div class='entry'><p>The New James Blake: <div class='center'>So show my why you're <em>strong</em>. \n\n Ignore <span class='textsc'>everybody</span> else \n\n We're alone now </div></p></div>"
      end

    end

  end

end
