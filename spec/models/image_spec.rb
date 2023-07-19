require 'rails_helper'

RSpec.describe Image, type: :model do
  before do
    @image = FactoryBot.build(:image)
  end

  describe '画像情報の作成' do
    context '画像情報を保存できる場合' do
      it '必要な情報があれば保存できる' do
        expect(@image).to be_valid
      end

      it '画像の説明がなくても保存できる' do
        @image.image_explanation = nil
        expect(@image).to be_valid
      end
    end

    context '画像情報を保存できない場合' do
      it '画像がなければ保存できない' do
        @image.image = nil
        @image.valid?
        expect(@image.errors.full_messages).to include("画像をアップロードしてください")
      end

      it '紐づく段落がなければ保存できない' do
        @image.paragraph = nil
        @image.valid?
        expect(@image.errors.full_messages).to include("段落を作成してください")
      end
    end
  end
end
