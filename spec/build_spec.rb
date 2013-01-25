require 'spec_helper'
require 'Hemingway/build'

module Hemingway

  describe Build do

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

end