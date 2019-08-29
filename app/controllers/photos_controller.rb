class PhotosController < ApplicationController

	def index
		@photos = Photo.all
		render :index
	end

	
	private 

	def photo_params
    params.require(:photo).permit(:user_id, :picture)
	end
end
