class ImagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_parents
  before_action :move_to_show
  before_action :find_image, only: [:edit, :update, :destroy]
  before_action :image_params, only: [:create, :update]

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:notice] = "画像を保存しました。"
      redirect_to edit_user_article_paragraph_path(@user, @article, @paragraph)
    else
      flash[:notice] = "画像を選択してください。"
      render :new
    end
  end

  def edit
  end

  def update
    @image = Image.find(params[:id])
    if @image.update(image_params)
      flash[:notice] = "画像を更新しました。"
      redirect_to edit_user_article_paragraph_path(@user, @article, @paragraph)
    else
      flash[:notice] = "画像を選択してください。"
      render :edit
    end
  end

  def destroy
    @image.destroy
    flash[:notice] = "画像を削除しました。"
    redirect_to edit_user_article_paragraph_path(@user, @article, @paragraph)
  end

  private

  def find_parents
    @user = User.find(params[:user_id])
    @article = Article.find(params[:article_id])
    @paragraph = Paragraph.find(params[:paragraph_id])
  end

  def find_image
    @image = Image.find(params[:id])
  end

  def move_to_show
    return unless current_user.id != params[:user_id].to_i
    redirect_to user_article_path(params[:user_id], params[:article_id])
  end

  def image_params
    params.permit(:image, :image_explanation, :paragraph_id)
  end
end
