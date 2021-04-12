class Order < ApplicationRecord
  belongs_to :user
  has_one :apply

  with_options presence: true do
    validates :title
    validates :first_keyword
    validates :second_keyword
    validates :third_keyword
    validates :fourth_keyword
    validates :fifth_keyword
    validates :words, format: { with: /\A\d{3,5}\z/, message: 'を入力してください' }
    validates :price, format: { with:/\A\d{3,5}\z/, message: 'を入力してください' }
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true, encoding: 'Shift_JIS:UTF-8') do |row|
      order = find_by(id: row['id']) || new
      order.attributes = row.to_hash.slice(*updatable_attributes)
      order.save!(validate: false )
    end
  end

  def self.updatable_attributes
    %w[id title first_keyword second_keyword third_keyword fourth_keyword fifth_keyword words price]
  end
end
