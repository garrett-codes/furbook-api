class CommentsController < ApplicationController
	def create
		comment = Comment.create(comment_params)
		# byebug
		if comment.valid?
      # Return that post
      render json: comment
    else
      # Give the user error messages
      render json: { errors: comment.errors.full_messages }, status: :not_acceptable
    end
	end

	def index
		comments = Comment.all
		render json: comments
	end

	def show
	  comment_id = params[:id]
	  comment = Comment.find(comment_id)
	  render json: comment
  end

	private

	def comment_params
		params.permit(:user_id, :post_id, :content)
	end
end
