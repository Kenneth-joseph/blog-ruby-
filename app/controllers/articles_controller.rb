class ArticlesController < ApplicationController
  def index
    @articles= Article.all
  end

  def show
    @article = Article.find(params[:id]) #the id params will help us capture the articles dynamic ids
  end
end
