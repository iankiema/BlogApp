class CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, only: %i[new create destroy]


  def index
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comments = @post.comments
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to post_path(@post)
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = current_user.comment.build
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    if @comment.destroy
      redirect_to user_post_path(@user, @post), flash[:notice] = 'Comment deleted!'
    else
      redirect_to user_post_path(@user, @post), alert: 'OOPSY Daisy!'
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
