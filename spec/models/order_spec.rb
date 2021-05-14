require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '#create' do
    before do
      @order = FactoryBot.build(:order)
    end

    it 'titleが空では登録できない' do
      @order.title = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Titleを入力してください")
    end

    it 'first_keywordが空では登録できない' do
      @order.first_keyword = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("First keywordを入力してください")
    end

    it 'second_keywordが空では登録できない' do
      @order.second_keyword = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Second keywordを入力してください")
    end

    it 'third_keywordが空では登録できない' do
      @order.third_keyword = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Third keywordを入力してください")
    end

    it 'fourth_keywordが空では登録できない' do
      @order.fourth_keyword = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Fourth keywordを入力してください")
    end

    it 'fifth_keywordが空では登録できない' do
      @order.fifth_keyword = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Fifth keywordを入力してください")
    end

    it 'wordsが空では登録できない' do
      @order.words = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Wordsを入力してください")
    end

    it 'wordsが6桁以上だと登録できない' do
      @order.words = 1234567
      @order.valid?
      expect(@order.errors.full_messages).to include("Wordsを入力してください")
    end

    it 'priceが空では登録できない' do
      @order.price = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Priceを入力してください")
    end

    it 'priceが6桁以上だと登録できない' do
      @order.price = 1234567
      @order.valid?
      expect(@order.errors.full_messages).to include("Priceを入力してください")
    end
  end
end
