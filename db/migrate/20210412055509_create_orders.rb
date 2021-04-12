class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.text :title,           null: false
      t.string :first_keyword,              null: false
      t.string :second_keyword, null: false
      t.string :third_keyword,         null: false
      t.string :fourth_keyword,          null: false
      t.string :fifth_keyword,    null: false
      t.integer :words ,    null: false
      t.integer   :price,           null: false
      t.timestamps
    end
  end
end
