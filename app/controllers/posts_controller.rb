class PostsController < ApplicationController
  before_action :set_user

  def index
    # logic to fetch all posts by a given user goes here
  end

  def show
    # logic to fetch a single post goes here
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
