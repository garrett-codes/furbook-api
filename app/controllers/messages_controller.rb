class MessagesController < ApplicationController
	def create
		message = Message.create(message_params)
		# byebug
		if message.valid?
      # Return that post
      render json: message
    else
      # Give the user error messages
      render json: { errors: @message.errors.full_messages }, status: :not_acceptable
    end
	end

	def index
		message = Message.all.reverse
		render json: message
	end

	def show
	  message_id = params[:id]
	  message = Message.find(message_id)
	  render json: message
  end

	# def show
	# 	@post = User.find(params[:id])
	# 	render :show
	# end

	private

	def message_params
		params.permit(:user_id, :friendship_id, :content)
	end
end
