class PostSerializer < ActiveModel::Serializer
  attributes :content, :user_id
  has_one :user
end
