require 'spec_helper'

module Hemingway

  describe Build do

    describe "#tag" do
      let(:attribute) { "div" }
      let(:content) { "king of the dinos" }
      let(:klass) { "trex" }
      let(:id) { "tom" }
      let(:href) { "http://t-bone.org" }

      it 'should generate a tag with no content or class' do
        Build.tag(attribute).should == "<#{attribute}></#{attribute}>"
      end

      it 'should generate a tag with content' do
        Build.tag(attribute, content).should == "<#{attribute}>#{content}</#{attribute}>"
      end

      it 'should generate a tag with content and a class' do
        Build.tag(attribute, content, :class => klass).should == "<#{attribute} class='#{klass}'>#{content}</#{attribute}>"
      end

      it 'should generate a tag with content and an id' do
        Build.tag(attribute, content, :id => id).should == "<#{attribute} id='#{id}'>#{content}</#{attribute}>"
      end

      it 'should generate a tag with content and an href' do
        Build.tag(attribute, content, :href => href).should == "<#{attribute} href='#{href}'>#{content}</#{attribute}>"
      end

      it 'should generate a tag with content and an id and a class' do
        Build.tag(attribute, content, :id => id, :class => klass).should == "<#{attribute} id='#{id}' class='#{klass}'>#{content}</#{attribute}>"
      end

      it 'should generate a tag with content and an id and a class and an href' do
        Build.tag(attribute, content, :id => id, :class => klass, :href => href).should == "<#{attribute} id='#{id}' class='#{klass}' href='#{href}'>#{content}</#{attribute}>"
      end

      it 'should generate a tag with content and a src and no closing tag' do
        Build.tag("img", nil, :src => "/assets/vibes.png", :close_tag => false).should == "<img src='/assets/vibes.png'>"
      end

      # Can't wait for Ruby 2.0
      it 'should generate a tag with content and a class and no content' do
        Build.tag(attribute, nil, :class => klass).should == "<#{attribute} class='#{klass}'></#{attribute}>"
      end

      it 'should allow me to create a tag that doesnt close' do
        Build.tag("hr", nil, :close_tag => false).should == "<hr>"
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