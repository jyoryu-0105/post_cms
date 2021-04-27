class AddColumnPosts < ActiveRecord::Migration[6.0]
  def up
    add_column :posts, :content, :text
  end
end
