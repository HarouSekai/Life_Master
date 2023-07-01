require 'rails_helper'

RSpec.describe Article, type: :model do
  before do
    @article = FactoryBot.build(:article)
  end

  describe '記事の作成' do
    context '記事を保存できる場合' do
      it '必要な情報があれば記事を保存できる' do
        expect(@article).to be_valid
      end
    end

    context '記事を作成できない場合' do
      it 'タイトルがなければ保存できない' do
        @article.title = ''
        @article.valid?
        expect(@article.errors.full_messages).to include("Title can't be blank")
      end

      it 'サマリーがなければ保存できない' do
        @article.summary = ''
        @article.valid?
        expect(@article.errors.full_messages).to include("Summary can't be blank")
      end

      it '紐づくユーザーがなければ保存できない' do
        @article.user = nil
        @article.valid?
        expect(@article.errors.full_messages).to include("User must exist")
      end
    end
  end
end
