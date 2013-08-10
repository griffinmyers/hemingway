module Hemingway
  module LinkNode
    def html
      Build.tag("a", description.text_value, :href => url.text_value, :target => "_blank")
    end
  end
end