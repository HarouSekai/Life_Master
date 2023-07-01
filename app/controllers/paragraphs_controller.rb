class ParagraphsController < ApplicationController
  before_action :find_user_article

  def new
    @paragraph = Paragraph.new
  end

  def create
    @paragraph = Paragraph.new(paragraph_params)
    if @paragraph.save
      redirect_to edit_user_article_path(@user, @article)
    else
      render :new
    end
  end

  private

  def find_user_article
    @user = params[:user_id]
    @article = params[:article_id]
  end

  def paragraph_params
    params.permit(:headline, :content, :article_id)
  end
end
