class ChangePublishDateOfPosts < ActiveRecord::Migration[6.0]
  def up
    change_column :posts, :publish_date, :date
  end

  def down
    change_column :posts, :publish_date, :integer
  end
end
