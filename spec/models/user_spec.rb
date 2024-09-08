require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録ができるとき' do
    it 'すべての情報が正しく入力されていれば登録できる' do
      expect(@user).to be_valid
    end
  end

  context 'ユーザー新規登録ができないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailに@が含まれていない場合、登録できない' do
      @user.email = 'testexample.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'メールアドレスが重複している場合、登録できない' do
      FactoryBot.create(:user, email: 'test@example.com')
      @user.email = 'test@example.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email has already been taken')
    end

    it 'passwordが空では登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが5文字以下では登録できない' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it '数字のみのパスワードでは登録できない' do
      @user.password = '123456'  
      @user.password_confirmation = '123456'
      @user.valid? 
      expect(@user.errors.full_messages).to include('Password は半角英数字混合で入力してください')
    end

    it '全角文字を含むパスワードでは登録できない' do
      @user.password = 'ａｂｃ123' 
      @user.password_confirmation = 'ａｂｃ123'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は半角英数字混合で入力してください')
    end

    it '英字のみのパスワードでは登録できない' do
      @user.password = 'abcdef'  
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は半角英数字混合で入力してください')
    end    

    it 'パスワードとパスワード確認が一致しない場合、登録できない' do
      @user.password = '123abc'
      @user.password_confirmation = '123abcd'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'last_nameが空では登録できない' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'first_nameが空では登録できない' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'last_nameが全角でない場合、登録できない' do
      @user.last_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name は全角（漢字・ひらがな・カタカナ）で入力してください')
    end

    it 'first_nameが全角でない場合、登録できない' do
      @user.first_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name は全角（漢字・ひらがな・カタカナ）で入力してください')
    end

    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'last_name_kanaが全角カタカナでない場合、登録できない' do
      @user.last_name_kana = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana は全角カタカナで入力してください')
    end

    it 'first_name_kanaが全角カタカナでない場合、登録できない' do
      @user.first_name_kana = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana は全角カタカナで入力してください')
    end

    it '生年月日が空の場合、登録できない' do
      @user.birth_date = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end
