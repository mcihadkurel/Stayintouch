module FriendshipsHelper
  private

  # def is_friend?(user1, user2)
  #   user1.friends.include?(user2)
  # end

  def friends(user)
    user.friendships.select(&:confirmed)
  end

  def mutual_friends(user1, user2)
    user1.friends & user2.friends
  end
end
