class AvatarsController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_show
  before_action :find_user_avatar

  def edit
  end

  def update
    if @user.avatar == nil
      @avatar = Avatar.new(avatar_params)
      @avatar.save
    else
      @avatar.update(avatar_params)
    end
    redirect_to user_path(@user)
  end

  def destroy
    @user.avatar.destroy
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
