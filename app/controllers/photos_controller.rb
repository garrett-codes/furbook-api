class PhotosController < ApplicationController

	def index
		@photos = Photo.all
		render :index
	end

	def create
		debugger
		photo = Photo.new(photo_params)
		if photo.save
			render json: {message: "You did it!"}
		else
			render json: photo.errors.full_messages
		end
	end

	
	private 

	def photo_params
    params.require(:photo).permit(:user_id, :picture)
	end
end
