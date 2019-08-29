class ProPicController < ApplicationController
	def pro_pic_params
    params.require(:pro_pic).permit(:picture)
	end
end
