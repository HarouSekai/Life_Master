class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @articles = Article.order("DESC updated_at")
  end

  def new
  end
end
