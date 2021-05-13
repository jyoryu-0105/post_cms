require 'rails_helper'

RSpec.describe Admin, type: :model do
  describe '#create' do
    before do
      @admin = FactoryBot.build(:admin)
    end

    it '必須項目が全てあれば登録できる' do
      expect(@admin).to be_valid
    end

    it 'ニックネームが空では登録できない' do
      @admin.nickname = nil
      @admin.valid?
      expect(@admin.errors.full_messages).to include("ニックネームを入力してください")
    end

    it 'メールアドレスが空では登録できない' do
      @admin.email = nil
      @admin.valid?
      expect(@admin.errors.full_messages).to include("Eメールを入力してください")
    end

    it 'メールアドレスが重複していたら登録できない' do
      @admin.save
      another_admin = FactoryBot.build(:admin, email: @admin.email)
      another_admin.valid?
      expect(another_admin.errors.full_messages).to include('Eメールはすでに存在します')
    end

    it 'メールアドレスに＠がなければ登録できない' do
      @admin.email = '1234567890'
      @admin.valid?
      expect(@admin.errors.full_messages).to include('Eメールは不正な値です')
    end

    it 'パスワードが空では登録できない' do
      @admin.password = nil
      @admin.valid?
      expect(@admin.errors.full_messages).to include("パスワードを入力してください")
    end

    it 'パスワードが6文字以下では登録できない' do
      @admin.password = 'A12B3'
      @admin.valid?
      expect(@admin.errors.full_messages).to include('パスワードは6文字以上で入力してください')
    end

    it 'パスワードが半角英数字混合でないと登録できない' do
      @admin.password = '123456'
      @admin.password_confirmation = '123456'
      @admin.valid?
      expect(@admin.errors.full_messages).to include('パスワードは半角英数字を混合して使用してください')
    end

    it '確認用パスワードが空だと登録できない' do
      @admin.password_confirmation = ''
      @admin.valid?
      expect(@admin.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

    it 'パスワードと確認用パスワードが一致しないと登録できない' do
      @admin.password = 'A12B34'
      @admin.password_confirmation = 'A12345'
      @admin.valid?
      expect(@admin.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
  end
end
