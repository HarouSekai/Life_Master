require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録' do
    context '新規登録ができる場合' do
      it '必要な情報が適切に入力されれば新規登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録ができない場合' do
      it 'ユーザー名がなければ新規登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ユーザー名を入力してください")
      end

      it 'メールアドレスがなければ登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end

      it 'メールアドレスは@を含まなければ登録できない' do
        @user.email = 'email'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end

      it '登録されているメールアドレスは登録できない' do
        another_user = FactoryBot.create(:user)
        @user.email = another_user.email
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールはすでに存在します')
      end

      it 'パスワードがなければ登録できない' do
        @user.password_confirmation = @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it 'パスワードが5文字以下では登録できない' do
        @user.password_confirmation = @user.password = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end

      it 'パスワードが129文字以上では登録できない' do
        @user.password_confirmation = @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードは128文字以内で入力してください'
      end

      it 'パスワードに全角文字が含まれる場合は登録できない' do
        @user.password_confirmation = @user.password = 'パスワードパスワード'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
      end

      it 'パスワードが英字のみでは登録できない' do
        @user.password_confirmation = @user.password = 'password'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
      end

      it 'パスワードが数字のみでは登録できない' do
        @user.password_confirmation = @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
      end

      it 'パスワードとパスワード（確認）が異なる場合は登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
    end
  end
end
