class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :find_article, only: [:show]

  def index
    @articles = Article.order("updated_at DESC")
  end

  def show

  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :summary).merge(user_id: current_user.id)
  end
end
