class User < ApplicationRecord
	has_secure_password
	has_many :photos, dependent: :destroy
	has_many :pro_pic, dependent: :destroy
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_and_belongs_to_many :friendships,
		class_name: "User",
		join_table: :friendships,
		foreign_key: :user_id,
		association_foreign_key: :friend_user_id
end
