class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password_digest, :email, :first_name, :last_name
  has_many :posts
  has_many :comments, through: :posts
  has_one :pro_pic
  has_many :photos

end
