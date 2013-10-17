require 'spec_helper'

module Hemingway

  describe Parser do

    before do
      @parser = Parser.new
    end

    describe "#override" do

      it 'should override a dash character' do
        html = @parser.parse("Please--- wait for me.").html
        html.should == "<div class='entry'><p>Please&mdash; wait for me.</p></div>"
      end

      it 'should override a single quotes' do
        html = @parser.parse("He made `onanistic' motions.").html
        html.should == "<div class='entry'><p>He made &#8216;onanistic&#8217; motions.</p></div>"
      end

      it 'should override a double quotes' do
        html = @parser.parse("He made ``onanistic'' motions.").html
        html.should == "<div class='entry'><p>He made &#8220;onanistic&#8221; motions.</p></div>"
      end

    end

  end

end