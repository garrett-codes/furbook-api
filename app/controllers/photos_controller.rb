class PhotosController < ApplicationController
skip_before_action :authorized
	def index
		@photos = Photo.all
		render :index
	end

	def create
		# debugger
		photo = Photo.new(photo_params)
		if photo.save
			render json: {message: "You did it!"}
		else
			render json: photo.errors.full_messages
		end
	end

	def destroy 
		photo_id = params[:id]
	  photo = Photo.find(photo_id)
	  photo.picture.purge
	  photo.destroy
	end

	def show
	  photo_id = params[:id]
	  photo = Photo.find(photo_id)
	  render json: photo
  end

	
	private 

	def photo_params
    params.require(:photo).permit(:user_id, :picture)
	end
end
