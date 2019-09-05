class ProPicsController < ApplicationController
	skip_before_action :authorized
	def index
		@pro_pics = ProPic.all
		render :index
	end

	def create
		debugger
		pro_pic = ProPic.new(pro_pic_params)
		if pro_pic.save
			render json: {message: "You did it!"}
		else
			render json: pro_pic.errors.full_messages
		end
	end

	
	private 

	def pro_pic_params
    params.require(:pro_pic).permit(:user_id, :picture)
	end
end
