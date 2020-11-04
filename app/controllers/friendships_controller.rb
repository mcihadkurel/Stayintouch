class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.new(friend_id: params[:friend_id])
    @friendship.save
    redirect_to users_path, notice: 'You have successfully sent a connection request'
  end

  def destroy
    @friendship = current_user.friendships.where(friend_id: params[:id])
    current_user.friendships.delete(@friendship)

    redirect_to users_path, notice: 'You have unfriended the user successfully'
  end
end
