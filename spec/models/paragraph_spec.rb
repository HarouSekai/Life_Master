require 'rails_helper'

RSpec.describe Paragraph, type: :model do
  before do
    @paragraph = FactoryBot.build(:paragraph)
  end

  describe '段落の作成' do
    context '段落を保存できる場合' do
      it '必要な情報があれば段落を保存できる' do
        expect(@paragraph).to be_valid
      end

      it '見出しがなくても段落を保存できる' do
        @paragraph.headline = ''
        expect(@paragraph).to be_valid
      end

      it '本文がなくても段落を保存できる' do
        @paragraph.content = ''
        expect(@paragraph).to be_valid
      end

      it '見出し、本文の両方がなくても保存できる' do
        @paragraph.headline = ''
        @paragraph.content = ''
        expect(@paragraph).to be_valid
      end
    end

    context '段落を保存できない場合' do
      it '紐づく記事がなければ保存できない' do
        @paragraph.article = nil
        @paragraph.valid?
        expect(@paragraph.errors.full_messages).to include("記事を作成してください")
      end
    end
  end
end
