class PostsController < ApplicationController
	def create
		post = Post.create(post_params)
		# byebug
		if post.valid?
      # Return that post
      render json: post
    else
      # Give the user error messages
      render json: { errors: post.errors.full_messages }, status: :not_acceptable
    end
	end

	def index
		posts = Post.all.reverse
		render json: posts
	end

	def show
	  post_id = params[:id]
	  post = Post.find(post_id)
	  render json: post
  end

	# def show
	# 	@post = User.find(params[:id])
	# 	render :show
	# end

	private

	def post_params
		params.permit(:user_id, :content)
	end
end
