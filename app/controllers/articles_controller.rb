class ArticlesController < ApplicationController
  def index
    @articles= Article.all
  end

  # displays each article on its own 
  def show
    @article = Article.find(params[:id]) #the id params will help us capture the articles dynamic ids
  end
  # creates a new articles by inducing forms
  def new
    @article = Article.new

  end
  # saves the newly created articles into the db, else redirect to the creation page(new)
  def create
    @article = Article.new(article_params)
     
    if  @article.save
      redirect_to @article
    else
      render :new
    end
  end
  # to prevent mulicious users from entering extra fields into the forms and overwriting private data, we'll use the rails feature strong parameters to help filter the params, before create uses the data from the user 
  private
  def article_params
    params.require(:article).permit(:title, :body, :author)
  end
end
