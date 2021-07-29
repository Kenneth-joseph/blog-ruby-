class CommentsController < ApplicationController

    # a create method action
    def create
        @article = Article.find(params[:article_id]) #find the specific article and store it in the variable article 
        @comment = @article.comments.create(comment_params) #retrive the article and create a comment for it
        redirect_to article_path(@article)
    end

    # destroy action 
    def destroy
        @article = Article.find(params[:article_id]) #find the specific article and store it in the variable article 
        @comment = @article.comments.find(params[:id]) # find the comment relatd to the article found above by id
        @comment.destroy #calls the destroy function on it
        redirect_to article_path(@article)
    end



private 
    def comment_params
        params.require(:comment).permit(:commenter, :body, :status)
    end
end