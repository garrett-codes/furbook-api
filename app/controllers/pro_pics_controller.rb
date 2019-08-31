class ProPicsController < ApplicationController
	def index
		@pro_pics = ProPic.all
		render :index
	end

	def create
		debugger
		pro_pic = ProPic.new(photo_params)
		if pro_pic.save
			render json: {message: "You did it!"}
		else
			render json: pro_pic.errors.full_messages
		end
	end

	
	private 

	def photo_params
    params.require(:pro_pic).permit(:user_id, :picture)
	end
end
