class CommentsController < ApplicationController
  before_action :find_user
  before_action :find_post, only: %i[new create]

  def new
    @comment = @post.comments.new
  end

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user # Assign the current user to the comment

    if @comment.save
      flash[:notice] = 'Comment created successfully.'
      redirect_to user_post_path(@user, @post)
    else
      render :new
    end
  end

  private

  def find_user
    @user = current_user
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text) # Make sure :text matches the attribute name for the comment content in your model.
  end
end
