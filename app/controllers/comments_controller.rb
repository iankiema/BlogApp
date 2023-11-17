class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to post_path(@post)
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
