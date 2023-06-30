class HomeController < ApplicationController
  def top
    if user_signed_in?
      redirect_to articles_path
    end
  end
end
