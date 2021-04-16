class PostContent < ApplicationRecord
  belongs_to :post
  has_rich_text :content
end
