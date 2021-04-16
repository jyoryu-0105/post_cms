class Post < ApplicationRecord
  has_one :post_content
  belongs_to :order
  belongs_to :user
end
