class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :find_article, only: [:show]
  before_action :find_user, only: [:index, :show, :new, :create]

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
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def find_user
    if user_signed_in?
      @user = User.find(current_user.id)
    end
  end

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :summary).merge(user_id: current_user.id)
  end
end
