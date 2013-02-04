module Hemingway

  module BlockNode
    def html
      type.html(block_content)
    end
  end

end