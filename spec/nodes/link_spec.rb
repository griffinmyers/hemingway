require 'spec_helper'

module Hemingway

  describe Parser do

    before do
      @parser = Parser.new
    end

    describe "#link" do

      it "parse ling tags" do
        html = @parser.parse("\\href{http://yachtvibe.com}{Click 4 Vibes}").html
        html.should == "<div class='entry'><p><a href='http://yachtvibe.com' target='_blank'>Click 4 Vibes</a></p></div>"
      end

    end
  end
end

