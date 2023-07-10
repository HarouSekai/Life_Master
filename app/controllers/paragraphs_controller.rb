class ParagraphsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user_article
  before_action :find_paragraph_images, only: [:edit, :update, :destroy]
  before_action :move_to_show

  def new
    @paragraph = Paragraph.new
  end

  def create
    @paragraph = Paragraph.new(paragraph_params)
    if @paragraph.save
      flash[:notice] = "段落が保存されました。"
      redirect_to edit_user_article_path(@user, @article)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @paragraph.update(paragraph_params)
      flash[:notice] = "段落が更新されました。"
      redirect_to edit_user_article_path(@user, @article)
    else
      render :edit
    end
  end

  def destroy
    @paragraph.destroy
    flash[:notice] = "段落を削除しました。"
    redirect_to edit_user_article_path(@user, @article)
  end

  private

  def find_user_article
    @user = params[:user_id]
    @article = params[:article_id]
  end

  def find_paragraph_images
    @paragraph = Paragraph.find(params[:id])
    @images = @paragraph.images
  end

  def paragraph_params
    params.permit(:headline, :content, :article_id)
  end

  def move_to_show
    return unless current_user.id != params[:user_id].to_i
    redirect_to user_article_path(params[:user_id], params[:article_id])
  end
end
