class PostsController < ApplicationController
  before_action :set_user, only: [:new, :create]

  def index
    set_user
    @user = User.find(params[:user_id])
    @posts = @user.posts
    @index ||= []
  end

  def new
    @post = @user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to user_post_path(current_user, @post), notice: 'Post Created successfully'
    else
      puts @post.errors.full_messages
      render :new
    end
  end

  def show
    set_user
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
    @user = current_user
  rescue ActiveRecord::RecordNotFound
    render plain: 'User not found', status: :not_found
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
