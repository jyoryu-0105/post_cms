class ChangePostStatusOfPosts < ActiveRecord::Migration[6.0]
  def up
    change_column :posts, :post_status, :integer, default: 0
  end

  def down
    change_column :posts, :post_status, :integer
  end

end
