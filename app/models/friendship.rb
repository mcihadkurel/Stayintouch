class Friendship < ApplicationRecord
  # after_create :create_inverse_friendship
  # after_destroy :delete_inverse_friendship

  belongs_to :user
  belongs_to :friend, class_name: 'User'

  # private

  # def create_inverse_friendship
  #   @inverse = Friendship.new(user_id: params[:friend_id], friend_id: current_user.id)
  #   @inverse.save
  # end

  # def delete_inverse_friendship
  #   @inverse = Friendship.where(friend_id: current_user.id, user_id: params[:id])
  #   Friendship.delete(@inverse)
  # end

  after_create do |f|
    if !Friendship.where(user_id: f.friend_id, friend_id: f.user_id).first # rubocop:disable Style/NegatedIf
      Friendship.create!(user_id: f.friend_id, friend_id: f.user_id, confirmed: false)
    end
  end

  after_destroy do |f|
    Friendship.where(friend_id: f.user_id, user_id: f.friend_id).delete_all
  end
end
