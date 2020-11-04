class FriendshipsController < ApplicationController
  #   after_action :create_inverse_friendship,

  def create
    friendship = current_user.friendships.new(friend_id: params[:friend_id], confirmed: true)
    friendship.save
    redirect_to users_path, notice: 'You have successfully sent a connection request'
  end

  def update
    @friendship = Friendship.where(user_id: params[:id], confirmed: false)
    @friendship.update(confirmed: true)
    redirect_to users_path
  end

  def destroy
    # friendship = current_user.friendships.where(friend_id: params[:id])
    Friendship.where(friend_id: params[:id], user_id: current_user.id).first.destroy
    # current_user.friendships.delete(@friendship)

    redirect_to users_path, notice: 'You have unfriended the user successfully'
  end
end
