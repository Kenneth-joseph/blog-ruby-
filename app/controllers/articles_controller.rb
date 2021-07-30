class ArticlesController < ApplicationController
  #adding the https authentication to prevent users from accessing the controller actions unless authenticated
  http_basic_authenticate_with name: "kent", password: "123", except: [:index, :show]

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

  # to help with edition of the articles we'll need to add two actions that will handle this process 
  def edit
    # we must first find the articles in the db using its parameters 
    @article = Article.find(params[:id])
  end

  def update 
    @article= Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
     render :edit
    end
  end

  # adding the delete action that will help delete the aticles 
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end
  # to prevent mulicious users from entering extra fields into the forms and overwriting private data, we'll use the rails feature strong parameters to help filter the params, before create uses the data from the user 
  private
  def article_params
    params.require(:article).permit(:title, :body, :author, :status)
  end
end
