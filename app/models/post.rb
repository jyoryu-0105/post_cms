class Post < ApplicationRecord
  belongs_to :order
  belongs_to :user
  has_rich_text :content
  has_many_attached :images
end
