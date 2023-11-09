class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build(user: current_user)
    @like.save
    redirect_to post_path(@post)
  end
end
