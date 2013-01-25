module Hemingway

  # This is a moronic little class to generate some HTML Tags around 
  # some content. 
  class Build
    def self.tag(html_attribute, html_content=nil, html_class=nil)
      String.new.tap do |t|
        t << "<" + html_attribute
        t << " class='" + html_class + "'" if html_class
        t << ">"
        t << html_content if html_content
        t << "</" + html_attribute + ">"
      end
    end
  end

end