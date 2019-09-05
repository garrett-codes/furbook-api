class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :user_id, :post_id, :created_at
  has_one :post
  has_one :user
end
