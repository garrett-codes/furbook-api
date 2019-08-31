class ProPicsController < ApplicationController
	def pro_pic_params
    params.permit(:picture)
	end
end
