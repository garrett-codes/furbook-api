class PhotoController < ApplicationController

	def create
		photo = Photo.create(photo_params)
	end

	def show
		@photo = Photo.find(params[:id])
		render :show
	end

	
	private 

	def photo_params
    params.require(:photo).permit(:user_id, :picture)
	end
end
