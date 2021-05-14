require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '#create' do
    before do
      @post = FactoryBot.build(:post)
    end

    it 'user_idが空では登録できない' do
      @post.user_id = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("Userを入力してください")
    end

    it 'order_idが空では登録できない' do
      @post.order_id = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("Orderを入力してください")
    end
  end
end
