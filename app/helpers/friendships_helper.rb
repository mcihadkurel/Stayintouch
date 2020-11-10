module FriendshipsHelper
  private

  def request_sent(current_user, user)
    current_user.friendships.select { |friendship| friendship.confirmed == false }
      .find_index { |f| f.friend_id == user.id }
  end

  def request_pending(current_user, user)
    current_user.friendships.select(&:confirmed)
      .find_index { |f| f.friend_id == user.id }
  end

  def request_confirmed(current_user, user)
    current_user_friends = current_user.friendships.select(&:confirmed)
      .find { |f| f.friend_id == user.id }
    user_friends = user.friendships.select(&:confirmed)
      .find { |f| f.friend_id == current_user.id }
    return true unless current_user_friends.nil? or user_friends.nil?
  end

  def friends(user)
    user.friendships.select(&:confirmed)
  end

  def are_friends?(current_user, user)
    friendships = friends(current_user)
    friendships.find_index { |f| f.friend_id == user.id }
  end
end
