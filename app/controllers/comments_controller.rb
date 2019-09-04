class CommentsController < ApplicationController
	def create
		post = Comment.create(comment_params)
		# byebug
		if post.valid?
      # Return that post
      render json: CommentSerializer.new(post)
    else
      # Give the user error messages
      render json: { errors: @post.errors.full_messages }, status: :not_acceptable
    end
	end

	def index
		comments = Comment.all.reverse
		render json: comments
	end

	# def show
	# 	@post = User.find(params[:id])
	# 	render :show
	# end

	private

	def comment_params
		params.permit(:user_id, :post_id, :content)
	end
end
