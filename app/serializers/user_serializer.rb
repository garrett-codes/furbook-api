class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password_digest, :email, :first_name, :last_name, :friends, :pending_friend_requests, :messages_info, :reverse_posts, :pro_pic_url
  has_many :posts
  has_many :comments, through: :posts
  has_many :pro_pics
  has_many :photos

  def pro_pic_url
    object.pro_pics.map{|pro_pic| pro_pic.pic}
  end

  def reverse_posts
    object.posts.reverse
  end

  def friends
  	
  	friendships = Friendship.all.select{|friendship| object.id == friendship.user_id || object.id == friendship.friend_user_id} 
  	friends = []
  	friendships.each do |friendship| 
  		if (friendship.user_id == object.id && !friendship.pending) 
  			friend = {user: User.find(friendship.friend_user_id), id: friendship.id}
  			# friend[:pending] = friendship.pending
  			friends << friend
  		elsif (friendship.friend_user_id == object.id && !friendship.pending)
  			friend = {user: User.find(friendship.user_id), id: friendship.id}
  			# friend[:pending] = friendship.pending
  			friends << friend
  		end
  	end
  	return friends
  end

  def pending_friend_requests
  	friendships = Friendship.all.select{|friendship| object.id == friendship.friend_user_id && friendship.pending} 
  	friendships.map{|friendship| {user: User.find(friendship.user_id), id: friendship.id}}
  end

  def messages_info
    messages_container = []
    object.friends.each do |friend_info| 
      messages = Friendship.find(friend_info[:id]).messages
      messages_info = {messages: messages.reverse , friend: friend_info[:user], friendship_id: friend_info[:id]}
      messages_container << messages_info
    end
    messages_container
  end
end
