class PostSerializer < ActiveModel::Serializer
  attributes :content, :user_id, :created_at
  has_one :user
end
