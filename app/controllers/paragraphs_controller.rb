class ParagraphsController < ApplicationController
  before_action :find_user_article

  def new
    @paragraph = Paragraph.new
  end

  def create
  end

  private

  def find_user_article
    @user = params[:user_id]
    @article = params[:article_id]
  end

end
