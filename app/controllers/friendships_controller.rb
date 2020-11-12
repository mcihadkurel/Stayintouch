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
    @friendship = Friendship.find_by(user_id: current_user.id, friend_id: params[:user_id])
    @invert_friendship = Friendship.find_by(user_id: params[:user_id], friend_id: current_user.id)

    if @invert_friendship.nil?
      @friendship.destroy
      redirect_to request.referrer, notice: 'Cancelled the friendship'
    else
      @invert_friendship.destroy
      @friendship.destroy
      redirect_to request.referrer, notice: 'Unfriended the friend'
    end
  end
end
