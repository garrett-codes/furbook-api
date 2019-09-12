class User < ApplicationRecord
	has_secure_password
	has_many :photos, dependent: :destroy
	has_many :pro_pics, dependent: :destroy
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy
  has_many :messages, dependent: :destroy
	has_and_belongs_to_many :friendships,
		class_name: "User",
		join_table: :friendships,
		foreign_key: :user_id,
		association_foreign_key: :friend_user_id

  validates :email, uniqueness: true
  validates :username, uniqueness: true
  validates :username, :password, :email, presence:


		def friends
  	
  	friendships = Friendship.all.select{|friendship| self.id == friendship.user_id || self.id == friendship.friend_user_id} 
  	friends = []
  	friendships.each do |friendship| 
  		if (friendship.user_id == self.id && !friendship.pending) 
  			friend = {user: User.find(friendship.friend_user_id), id: friendship.id}
  			# friend[:pending] = friendship.pending
  			friends << friend
  		elsif (friendship.friend_user_id == self.id && !friendship.pending)
  			friend = {user: User.find(friendship.user_id), id: friendship.id}
  			# friend[:pending] = friendship.pending
  			friends << friend
  		end
  	end
  	return friends
  end
end
