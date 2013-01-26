require 'spec_helper'

module Hemingway

  describe Build do

    describe "#tag" do
      let(:attribute) { "div" }
      let(:content) { "king of the dinos" }
      let(:klass) { "trex" }

      it 'should generate a tag with no content or class' do
        Build.tag(attribute).should == "<#{attribute}></#{attribute}>"
      end

      it 'should generate a tag with content' do
        Build.tag(attribute, content).should == "<#{attribute}>#{content}</#{attribute}>"
      end

      it 'should generate a tag with content and a class' do
        Build.tag(attribute, content, klass) == "<#{attribute} class='#{klass}'>#{content}</#{attribute}>"
      end 

      # Can't wait for Ruby 2.0
      it 'should generate a tag with content and a class and no content' do
        Build.tag(attribute, nil, klass) == "<#{attribute} class='#{klass}'></#{attribute}>"
      end

    end

    describe "#symbol" do

      let(:symbol) { "\\Delta" }

      it 'should translate the Latex symbol into an html equiavalent' do
        Build.symbol(symbol).should == "&Delta;"
      end

    end

  end

end