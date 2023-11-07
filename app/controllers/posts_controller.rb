class PostsController < ApplicationController
  before_action :find_user, only: [:index]
  before_action :find_post, only: [:show]

  def index
    @posts = @user.posts
  end

  def show; end

  private

  # This method will only be used by the index action
  def find_user
    @user = User.find(params[:user_id])
  end

  # This method will only be used by the show action
  def find_post
    @post = Post.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'Post not found. Redirecting to posts list.'
    redirect_to posts_path
  end
end
