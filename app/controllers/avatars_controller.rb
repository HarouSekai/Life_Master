class AvatarsController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_show
  before_action :find_user_avatar

  def edit
  end

  def update
    if @user.avatar == nil
      @avatar = Avatar.new(avatar_params)
      if @avatar.save
        redirect_to user_path(@user)
      else
        flash[:notice] = "画像を選択してください。"
        render :edit
      end
    else
      if @avatar.update(avatar_params)
        redirect_to user_path(@user)
      else
        flash[:notice] = "画像を選択してください。"
        render :edit
      end
    end
  end

  def destroy
    unless @user.avatar == nil
      @user.avatar.destroy
    end
    redirect_to user_path(@user)
  end

  private

  def find_user_avatar
    @user = User.find(params[:user_id])
    @user.avatar == nil ? @avatar = Avatar.new : @avatar = Avatar.find(@user.avatar.id)
  end

  def avatar_params
    params.permit(:avatar, :user_id)
  end

  def move_to_show
    return if params[:user_id].to_i == current_user.id
    redirect_to "/users/#{params[:user_id]}"
  end
end
