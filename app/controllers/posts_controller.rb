class PostsController < ApplicationController
	def create
		post = Post.create(post_params)
		# byebug
	end

	# def show
	# 	@post = User.find(params[:id])
	# 	render :show
	# end

	private 

	def user_params
		params.permit(:user_id, :content)
	end
end
