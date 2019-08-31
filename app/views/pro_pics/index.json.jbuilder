json.array! @pro_pics do |pro_pic|
	json.extract! pro_pic, :id, :user_id
	json.pro_picUrl url_for(pro_pic.picture)
end