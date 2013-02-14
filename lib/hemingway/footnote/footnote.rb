module Hemingway
  module FootnoteNode
    # This is the method that will place the anchor tag and id of the 
    # footnote within the paragraph body itself. 
    def html(id)
      inline_footnote_label = Build.tag("span", id.to_s, :class => "inline-footnote-number")
      Build.tag("a", inline_footnote_label, :href => "#footnote#{id}")
    end

    # This is the method that will actually spit out the div that the 
    # footnote's content is in. This will generally be called after all of the 
    # paragraph's text has been spit out so that the footnotes can be appended
    # after. Note that it needs to be passed an id from the caller so that it 
    # can be linked to corretly with an anchor tag in the body of the main text. 
    def footnote_html(id)
      footnote_label = Build.tag("span", id.to_s, :class => "footnote-number")
      footnote_content = sequence.elements.map { |s| s.html }.join
      Build.tag("div", footnote_label + footnote_content, :id => "footnote#{id}", :class => "footnote")
    end
  end
end