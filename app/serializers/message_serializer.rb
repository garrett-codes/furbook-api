class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :message_user, :viewed
  has_one :user
  has_one :friendship

  def message_user
  	object.user
  end
end
