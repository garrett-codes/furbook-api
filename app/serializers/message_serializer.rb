class MessageSerializer < ActiveModel::Serializer
  attributes :id
  has_one :message_container
  has_one :user
end
