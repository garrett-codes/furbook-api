class Message < ApplicationRecord
  belongs_to :message_container
  belongs_to :user
  belongs_to :friendship
end
