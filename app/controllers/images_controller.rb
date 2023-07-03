class ImagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_parents
  before_action :move_to_show
  before_action :image_params, only: :create

  def new
    @image = Image.new
  end

  def create
    if @image_data
      @image = Image.new(image_explanation: @image_exp, paragraph_id: @paragraph_id)
      if @image.save
        binding.pry
        create_image
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

  private

  def find_parents
    @user = User.find(params[:user_id])
    @article = Article.find(params[:article_id])
    @paragraph = Paragraph.find(params[:paragraph_id])
  end

  def move_to_show
    return unless current_user.id != params[:user_id].to_i
    redirect_to user_article_path(params[:user_id], params[:article_id])
  end

  def image_params
    @image_data = params.permit(:image)[:image]
    @image_exp = params.permit(:image_exp)[:image_exp]
    @paragraph_id = params.permit(:paragraph_id)[:paragraph_id]
  end

  def create_image
    image_path = "public/image/#{@image.id}.png"
    File.binwrite(image_path, @image_data.read)
  end
end
