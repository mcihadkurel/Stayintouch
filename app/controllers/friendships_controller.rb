class FriendshipsController < ApplicationController
  #   after_action :create_inverse_friendship,

  def create
    @friendship = current_user.friendships.new(friend_id: params[:user_id])

    if @friendship.save
      redirect_to users_path, notice: 'You sent a new invite.'
    else
      redirect_to users_path, alert: 'Something went wrong with the invite!'
    end
  end

  def destroy
    @friendship = Friendship.where(user_id: current_user, friend_id: params[:id])
    @invert_friendship = Friendship.where(user: @friend, friend: current_user)
    @friendship.destroy
    @invert_friendship.destroy
  end
end
