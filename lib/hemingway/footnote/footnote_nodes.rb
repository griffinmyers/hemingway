module Hemingway
  module FootnoteNode
    # This is the method that will place the anchor tag and id of the
    # footnote within the paragraph body itself.
    #
    # I'm passing in a time variable here to make links unique. You see,
    # if you parse many of these entries on a single HTML page you'll end up
    # with multiple #footnote1 divs. To make them unique, we'll pass down
    # a time variable from above to seed them.
    def html(id, time)
      inline_footnote_label = Build.tag("span", Build.tag("sup", id.to_s), :class => "inline-footnote-number")
      Build.tag("a", inline_footnote_label, :href => "#footnote#{id}#{time}")
    end

    # This is the method that will actually spit out the div that the
    # footnote's content is in. This will generally be called after all of the
    # paragraph's text has been spit out so that the footnotes can be appended
    # after. Note that it needs to be passed an id from the caller so that it
    # can be linked to corretly with an anchor tag in the body of the main text.
    #
    # I'm passing in a time variable here to make links unique. You see,
    # if you parse many of these entries on a single HTML page you'll end up
    # with multiple #footnote1 divs. To make them unique, we'll pass down
    # a time variable from above to seed them.
    def footnote_html(id, time)
      footnote_label = Build.tag("span", Build.tag("sup", id.to_s), :class => "footnote-number")
      footnote_content = sequence.elements.map { |s| s.html }.join
      Build.tag("div", footnote_label + footnote_content, :id => "footnote#{id}#{time}", :class => "footnote")
    end
  end
end