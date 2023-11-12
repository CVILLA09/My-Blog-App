class PostsController < ApplicationController
  before_action :find_user, only: %i[index show new create like]
  before_action :find_post, only: [:show, :like]

  # GET /users/:user_id/posts
  def index
    @posts = @user.posts
  end

  # GET /users/:user_id/posts/:id
  def show
    puts @post.body
  end

  # GET /users/:user_id/posts/new
  def new
    @post = @user.posts.build
  end

  # POST /users/:user_id/posts
  def create
    @post = @user.posts.build(post_params)
    if @post.save
      redirect_to user_post_path(@user, @post), notice: 'Post was successfully created.'
    else
      render :new
    end
  end

    # POST /users/:user_id/posts/:id/like
    def like
      @post.increment!(:likes_counter)
      redirect_to user_posts_path(@user), notice: 'You liked a post!'
    end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_post
    @post = @user.posts.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'Post not found. Redirecting to user posts.'
    redirect_to user_posts_path(@user)
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
