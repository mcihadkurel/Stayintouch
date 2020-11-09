class FriendshipsController < ApplicationController
  #   after_action :create_inverse_friendship,

  def create
    friendship = current_user.friendships.new(friend_id: params[:friend_id], confirmed: false)
    friendship.save
    redirect_to users_path, notice: 'You have successfully sent a connection request'
  end

  def update
    @friendship = Friendship.where(user_id: current_user.id, friend_id: params[:id], confirmed: true)
    @friendship.update(confirmed: true)
    redirect_to current_user
  end

  def destroy
    Friendship.where(friend_id: params[:id], user_id: current_user.id).first.destroy
    redirect_to users_path, notice: 'You have unfriended the friend successfully'
  end
end
