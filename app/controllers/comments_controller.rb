class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comments.user = current_user
    @comment.after_save
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
