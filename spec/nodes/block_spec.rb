require 'spec_helper'

module Hemingway

  describe LatexParser do

    before do
      @parser = Parser.new
    end 

    describe "#itemize" do

      it 'allows me to create an itemized list' do
        html = @parser.parse("\\begin{itemize}\\item thing 1 \\item thing 2 \\end{itemize}").html
        html.should == "<div class='document'><p><ul><li>thing 1 </li><li>thing 2 </li></ul></p></div>"
      end

      it 'eats up any extra newlines and such between items' do
        html = @parser.parse("\\begin{itemize}\\item thing 1 \n\n\n \\item thing 2 \n \\end{itemize}").html
        html.should == "<div class='document'><p><ul><li>thing 1 </li><li>thing 2 </li></ul></p></div>"
      end 

      it 'supports text, tags, special chars, math inline' do
        html = @parser.parse("\\begin{itemize}\\item hey \\emph{$\\lambda$} \\$ buddies \\end{itemize}").html
        html.should == "<div class='document'><p><ul><li>hey <em>&lambda;</em> $ buddies </li></ul></p></div>"
      end

      it 'supports items to have labels on them with various spacing' do
        html = @parser.parse("\\begin{itemize}\\item[bros] over hoes \\item \n [chicks] before dicks \\end{itemize}").html
        html.should == "<div class='document'><p><ul><li><span class='label'>bros</span> over hoes </li><li><span class='label'>chicks</span> before dicks </li></ul></p></div>"
      end

      it 'supports text, tags, special chars, and math in labels' do
        html = @parser.parse("\\begin{itemize}\\item[so many \\emph{vibes} $\\lambda$ \\$ \\$] to be had \\end{itemize}").html
        html.should == "<div class='document'><p><ul><li><span class='label'>so many <em>vibes</em> &lambda; $ $</span> to be had </li></ul></p></div>"
      end

      it 'supports empty labels' do
        html = @parser.parse("\\begin{itemize}\\item[] do or do not \\end{itemize}").html
        html.should == "<div class='document'><p><ul><li><span class='label'></span> do or do not </li></ul></p></div>"
      end

      it 'supports empty items with labels' do
        html = @parser.parse("\\begin{itemize}\\item[Millenium \\emph{Falcon}] \\item Slave-1 \\end{itemize}").html
        html.should == "<div class='document'><p><ul><li><span class='label'>Millenium <em>Falcon</em></span> </li><li>Slave-1 </li></ul></p></div>"
      end

      it 'supports empty items without labels' do
        html = @parser.parse("\\begin{itemize}\\item \\item ears off a gundart \\end{itemize}").html
        html.should == "<div class='document'><p><ul><li></li><li>ears off a gundart </li></ul></p></div>"
      end

      it 'should allow me to nest some lists' do
        html = @parser.parse("\\begin{itemize} \\item[another list] \\begin{itemize} \\item[nesting \\emph{vibes}] over here \\end{itemize} \\item for good measure \\end{itemize}").html
        html.should == "<div class='document'><p><ul><li><span class='label'>another list</span> <ul><li><span class='label'>nesting <em>vibes</em></span> over here </li></ul> </li><li>for good measure </li></ul></p></div>"
      end

      it 'should nest 3 layers deep just for fun' do
        html = @parser.parse("\\begin{itemize} \\item \\begin{itemize} \\item \\begin{itemize} \\item hey \\end{itemize} \\end{itemize} \\end{itemize}").html
        html.should == "<div class='document'><p><ul><li><ul><li><ul><li>hey </li></ul> </li></ul> </li></ul></p></div>"
      end

    end

  end
end

