module Hemingway

  module VerbatimNode
    def html(block_content)
      Build.tag("pre", block_content.html)
    end
  end

end