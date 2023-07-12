require 'rails_helper'

RSpec.describe Avatar, type: :model do
  before do
    @avatar = FactoryBot.build(:avatar)
  end

  describe 'アバターの作成' do
    context 'アバターを保存できる場合' do
      it '必要な情報があればアバターを保存できる' do
        expect(@avatar).to be_valid
      end
    end

    context 'アバターを保存できない場合' do
      it 'アバター画像がなければアバターを保存できない' do
        @avatar.avatar = nil
        @avatar.valid?
        expect(@avatar.errors.full_messages).to include("Avatar can't be blank")
      end

      it '紐づくユーザーがなければ保存できない' do
        @avatar.user = nil
        @avatar.valid?
        expect(@avatar.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
