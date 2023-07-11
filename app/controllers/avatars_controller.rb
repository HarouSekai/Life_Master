class AvatarsController < ApplicationController
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

  private

  def find_user_avatar
    @user = User.find(current_user.id)
    @user.avatar == nil ? @avatar = Avatar.new : @avatar = Avatar.find(@user.avatar.id)
  end

  def avatar_params
    params.permit(:avatar, :user_id)
  end
end
