class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password_digest, :email, :first_name, :last_name, :friends, :pending_friend_requests, :bio, :animal, :breed, :birth_date, :lives_in, :from, :family, :favorite_hobbies
  has_many :posts
  has_many :comments, through: :posts
  has_many :pro_pic
  has_many :photos

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
end
