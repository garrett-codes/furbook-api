class ProPicSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :picture
  has_one :user

  def picture
    return unless object.picture.attached?

    object.picture.blob.attributes
          .slice('filename', 'byte_size')
          .merge(url: picture_url)
          .tap { |attrs| attrs['name'] = attrs.delete('filename') }
  end

  def picture_url
    url_for(object.picture)
  end
end
