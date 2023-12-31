class UsersController < ApplicationController
  before_action :find_user, only: [:show]

  def index
    @users = User.includes(:posts).all
  end

  def show; end

  private

  def find_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'User not found. Redirecting to users list.'
    redirect_to users_path
  end
end
