require 'spec_helper'

module Hemingway

  describe LatexParser do

    before do
      @parser = Parser.new
    end 

    describe "#footnote" do

      it "should put a footnote at the end of a paragraph" do
        html = @parser.parse("You are what you redpoint\\footnote{sending a lead route}, after all.").html
        html.should == "<div class='entry'><p>You are what you redpoint<a href='#footnote1'><span class='inline-footnote-number'><sup>1</sup></span></a>, after all.</p><div id='footnote1' class='footnote'><span class='footnote-number'><sup>1</sup></span>sending a lead route</div></div>"
      end

      it "should put properly increment the footnote count per entry" do
        html = @parser.parse("Slowly, Vader\\footnote{thug} approached Luke\\footnote{homeboy}").html
        html.should == "<div class='entry'><p>Slowly, Vader<a href='#footnote1'><span class='inline-footnote-number'><sup>1</sup></span></a> approached Luke<a href='#footnote2'><span class='inline-footnote-number'><sup>2</sup></span></a></p><div id='footnote1' class='footnote'><span class='footnote-number'><sup>1</sup></span>thug</div><div id='footnote2' class='footnote'><span class='footnote-number'><sup>2</sup></span>homeboy</div></div>"
      end

      it "should support any type of content in a footnote" do
        html = @parser.parse("Dave Graham\\footnote{\\emph{Boulderer}, and \& all around \\textsc{good} guy $\\gamma$} makes the best mixtapes").html
        html.should == "<div class='entry'><p>Dave Graham<a href='#footnote1'><span class='inline-footnote-number'><sup>1</sup></span></a> makes the best mixtapes</p><div id='footnote1' class='footnote'><span class='footnote-number'><sup>1</sup></span><em>Boulderer</em>, and & all around <span class='textsc'>good</span> guy &gamma;</div></div>"
      end

      it "should properly place footnotes from all paragraphs after all paragraphs an increment properly" do
        html = @parser.parse("Freddie Gibbs\\footnote{from Gary, Indiana} is hood\\footnote{thug} as all hell.\n\n John Russel\\footnote{of Short Bus fame} almost got raped in Gary, ID\\footnote{but not by Freddie Gibbs}").html
        html.should == "<div class='entry'><p>Freddie Gibbs<a href='#footnote1'><span class='inline-footnote-number'><sup>1</sup></span></a> is hood<a href='#footnote2'><span class='inline-footnote-number'><sup>2</sup></span></a> as all hell.</p><p> John Russel<a href='#footnote3'><span class='inline-footnote-number'><sup>3</sup></span></a> almost got raped in Gary, ID<a href='#footnote4'><span class='inline-footnote-number'><sup>4</sup></span></a></p><div id='footnote1' class='footnote'><span class='footnote-number'><sup>1</sup></span>from Gary, Indiana</div><div id='footnote2' class='footnote'><span class='footnote-number'><sup>2</sup></span>thug</div><div id='footnote3' class='footnote'><span class='footnote-number'><sup>3</sup></span>of Short Bus fame</div><div id='footnote4' class='footnote'><span class='footnote-number'><sup>4</sup></span>but not by Freddie Gibbs</div></div>"
      end

      it "will obviously allow me to drop a list in a footnote (this is just for my own satisfaction mostly)" do
        html = @parser.parse("There are some rules\\footnote{\\begin{itemize} \\item Steezy socks always \\item Brosend often \\item Everything for the ladies \\end{itemize}} that we all must live by.").html
        html.should == "<div class='entry'><p>There are some rules<a href='#footnote1'><span class='inline-footnote-number'><sup>1</sup></span></a> that we all must live by.</p><div id='footnote1' class='footnote'><span class='footnote-number'><sup>1</sup></span><ul><li>Steezy socks always </li><li>Brosend often </li><li>Everything for the ladies </li></ul></div></div>"
      end

    end

  end
end

