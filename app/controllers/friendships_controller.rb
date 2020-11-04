class FriendshipsController < ApplicationController
  after_action :create_inverse_friendship, :delete_inverse_friendship

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

  private

  def create_inverse_friendship
    @inverse = Friendship.new(user_id: params[:friend_id], friend_id: current_user.id)
    @inverse.save
  end

  def delete_inverse_friendship
    @inverse = Friendship.where(friend_id: current_user.id, user_id: params[:id])
    Friendship.delete(@inverse)
  end
end
