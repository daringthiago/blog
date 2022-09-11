class CommentsController < ApplicationController


  #before_action :set_customer, except: [:index, :show]  
  before_action :authenticate_user!
  #http_basic_authenticate_with name: "thiago", password: "123", only: :destroy

  def create
    @article = Article.find(params[:article_id])
    # ...
  end

  # snippet for brevity


  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end

end
