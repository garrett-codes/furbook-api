class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password_digest, :email, :first_name, :last_name, :friends 
  has_many :posts
  has_many :comments, through: :posts
  has_many :pro_pic
  has_many :photos

  def friends
  	
  	friendships = Friendship.all.select{|friendship| object.id == friendship.user_id || object.id == friendship.friend_user_id} 
  	friendships.map do |friendship| 
  		if (friendship.user_id == object.id) 
  			return User.find(friendship.friend_user_id)
  		else
  			return User.find(friendship.user_id)
  		end
  	end
  end

end
