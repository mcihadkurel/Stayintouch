class Friendship < ApplicationRecord
  

  belongs_to :user
  belongs_to :friend, class_name: 'User'

  

  after_create do |f|
    if !Friendship.where(user_id: f.friend_id, friend_id: f.user_id).first # rubocop:disable Style/NegatedIf
      Friendship.create!(user_id: f.friend_id, friend_id: f.user_id, confirmed: false)
    end
  end

  after_destroy do |f|
    Friendship.where(friend_id: f.user_id, user_id: f.friend_id).delete_all
  end
end
