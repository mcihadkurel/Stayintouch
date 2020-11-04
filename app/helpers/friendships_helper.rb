module FriendshipsHelper
  def is_friend?(user1, user2)
    user1.friends.include?(user2)
  end
end
