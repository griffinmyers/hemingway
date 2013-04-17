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

    end

  end

end