class PostsController < ApplicationController
  before_action :set_user, only: %i[index show]

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def like
    @post = Post.find(params[:id])
    if current_user.likes.exists?(post: @post)
      redirect_to @post, alert: 'You have already liked this post.'
    else
      current_user.likes.create(post: @post)
      redirect_to @post, notice: 'Post liked!'
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
