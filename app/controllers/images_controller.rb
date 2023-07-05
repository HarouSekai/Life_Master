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
    if @image_data
      @image = Image.new(@image_parameter)
      if @image.save
        binwrite_image
        redirect_to edit_user_article_paragraph_path(@user, @article, @paragraph)
      else
        flash[:notice] = "画像の保存に失敗しました。"
        render :new
      end
    else
      flash[:notice] = "画像を選択してください。"
      render :new
    end
  end

  def edit
  end

  def update
    if @image_data
      if @image.update(@image_parameter)
        binwrite_image
        flash[:notice] = "画像を更新しました。画像が表示されない場合は、ブラウザを閉じてから、再びアクセスしてください。"
        redirect_to edit_user_article_paragraph_path(@user, @article, @paragraph)
      else
        flash[:notice] = "画像の更新に失敗しました。"
        render :edit
      end
    else
      flash[:notice] = "画像を選択してください。"
      render :edit
    end
  end

  def destroy
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
    @image_data = params.permit(:image)[:image]
    @image_exp = params.permit(:image_exp)[:image_exp]
    @paragraph_id = params.permit(:paragraph_id)[:paragraph_id]
    @image_parameter = {image_explanation: @image_exp, paragraph_id: @paragraph_id}
  end

  def binwrite_image
    image_path = "public/image/#{@image.id}.png"
    File.binwrite(image_path, @image_data.read)
  end
end
