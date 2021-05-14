require 'rails_helper'

RSpec.describe Apply, type: :model do
  describe '#create' do
    before do
      @apply = FactoryBot.build(:apply)
    end

    it 'user_idが空では登録できない' do
      @apply.user_id = nil
      @apply.valid?
      expect(@apply.errors.full_messages).to include("Userを入力してください")
    end

    it 'order_idが空では登録できない' do
      @apply.order_id = nil
      @apply.valid?
      expect(@apply.errors.full_messages).to include("Orderを入力してください")
    end
  end
end
