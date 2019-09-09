class Photo < ApplicationRecord
  belongs_to :user
  has_one_attached :picture, dependent: :destroy
end
