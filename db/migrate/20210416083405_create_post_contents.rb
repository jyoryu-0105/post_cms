class CreatePostContents < ActiveRecord::Migration[6.0]
  def change
    create_table :post_contents do |t|
      t.text :content
      t.references :post, null: false, foreign_key: true
      t.timestamps
    end
  end
end
