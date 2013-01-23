module Hemingway

  # This is a moronic little function to generate some HTML Tags around 
  # some content. 
  def self.tag_for(html_attribute, html_class="", html_content="")
    String.new.tap do |t|
      t << "<" + html_attribute + " class='" + html_class + "'>"
      t << html_content
      t << "</" + html_attribute + ">"
    end
  end

end