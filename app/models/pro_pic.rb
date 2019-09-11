class ProPic < ApplicationRecord
	include Rails.application.routes.url_helpers
  belongs_to :user
  has_one_attached :picture, dependent: :destroy

  def pic
    return unless self.picture.attached?

    self.picture.blob.attributes
          .slice('filename', 'byte_size')
          .merge(url: pic_url)
          .tap { |attrs| attrs['name'] = attrs.delete('filename') }
  end

  def pic_url
    url_for(self.picture)
  end
end
