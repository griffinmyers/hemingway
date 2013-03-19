require 'spec_helper'

module Hemingway

  describe LatexParser do

    before do
      @parser = LatexParser.new
    end

    describe "#special" do

      it 'should escape a special character' do
        html = @parser.parse("War \\& Peace").html
        html.should == "<div class='entry'><p>War & Peace</p></div>"
      end

      it 'should allow for special chars and tags in sequence' do
        html = @parser.parse("War \\& Peace \\textbf{Tolstoy} \\#").html
        html.should == "<div class='entry'><p>War & Peace <strong>Tolstoy</strong> #</p></div>"
      end

    end

  end

end