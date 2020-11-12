class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
  end

  def update
    @user = User.find(params[:user_id])

    if current_user.confirm_friend(@user)
      redirect_to users_path, notice: 'Friend request accepted.'
    else
      redirect_to users_path, alert: 'Something went wrong with accepting the request.'
    end
  end

  def destroy
    @user = User.find(params[:user_id])

    if current_user.reject_request(@user)
      redirect_to users_path, notice: 'Friendship request rejected successfully.'
    else
      redirect_to users_path, alert: 'Something went wrong with the rejection.'
    end
  end
end
