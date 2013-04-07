require 'spec_helper'

module Hemingway

  describe Parser do

    before do
      @parser = Parser.new
    end

    describe "#special" do

      it 'should escape a special character' do
        html = @parser.parse("War \\& Peace").html
        html.should == "<div class='entry'><p>War & Peace</p></div>"
      end

      it 'should escape a special backslash character' do
        html = @parser.parse("\\textbackslash{}part").html
        html.should == "<div class='entry'><p>\\part</p></div>"
      end


      it 'should allow for special chars and tags in sequence' do
        html = @parser.parse("War \\& Peace \\textbf{Tolstoy} \\#").html
        html.should == "<div class='entry'><p>War & Peace <strong>Tolstoy</strong> #</p></div>"
      end

    end

  end

end