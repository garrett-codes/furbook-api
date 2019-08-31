json.array! @photos do |photo|
	json.extract! photo, :id, :user_id
	json.photoUrl url_for(photo.picture)
end