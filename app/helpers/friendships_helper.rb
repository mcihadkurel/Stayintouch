module FriendshipsHelper
  private
  def requestSent(current_user, user)
    current_user.friendships.select { |friendship| friendship.confirmed == false }.find_index { |f| f.friend_id == user.id }
  end
  def requestPending(current_user, user)
    current_user.friendships.select(&:confirmed).find_index { |f| f.friend_id == user.id }
  end
  def requestConfirmed(current_user, user)
    current_user_friends = current_user.friendships.select(&:confirmed).find { |f| f.friend_id == user.id }
    user_friends = user.friendships.select(&:confirmed).find { |f| f.friend_id == current_user.id }
    return true unless current_user_friends.nil? or user_friends.nil?
  end
def is_friend?(user1, user2)
user1.friends.include?(user2)
end

def friends(user)
 user.friendships.select(&:confirmed)
end

def are_friends?(current_user, user)
  friendships = friends(current_user)
 friendships.find_index { |f| f.friend_id == user.id }
 end

def mutual_friends(user1, user2)
   user1.friends & user2.friends
end
end
