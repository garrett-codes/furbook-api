class User < ApplicationRecord
	has_secure_password
	has_many :photos
	has_one :pro_pic
	has_many :posts
end
