class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  before_action :find_paragraphs, only: [:show, :edit]
  before_action :find_current_user, only: [:index, :new, :create, :edit, :update]
  before_action :move_to_show, only: [:edit, :update, :destroy]

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
      flash[:notice] = "記事が保存されました。"
      redirect_to edit_user_article_path(@user, @article)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "記事が更新されました。"
      redirect_to edit_user_article_path(@user, @article)
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
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

  def find_paragraphs
    @paragraphs = @article.paragraphs.order("created_at ASC")
  end

  def article_params
    params.require(:article).permit(:title, :summary).merge(user_id: current_user.id)
  end

  def move_to_show
    return unless current_user.id != params[:user_id].to_i
    redirect_to user_article_path(params[:user_id], params[:id])
  end
end
