class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :find_article, only: [:show, :edit, :update]
  before_action :find_current_user, only: [:index, :new, :create, :edit, :update]
  before_action :moove_to_show, only: [:edit, :update]

  def index
    @articles = Article.order("updated_at DESC")
  end

  def show
    @user = User.find(params[:user_id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to edit_user_article_path(@user, @article)
    else
      render :new
    end
  end

  def edit
    @paragraphs = @article.paragraphs
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "記事が更新されました"
      redirect_to edit_user_article_path(@user, @article)
    else
      render :edit
    end
  end

  private

  def find_current_user
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

  def moove_to_show
    unless current_user.id == @article.user.id
      redirect_to user_article_path(@article.user, @article)
    end
  end
end
