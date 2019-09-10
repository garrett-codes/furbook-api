class MessagesController < ApplicationController
	def create
		message = Message.create(message_params)
		# byebug
		if message.valid?
      # Return that post
      render json: message
    else
      # Give the user error messages
      render json: { errors: message.errors.full_messages }, status: :not_acceptable
    end
	end

	def index
		messages = Message.all
		render json: comments
	end

	def show
	  message_id = params[:id]
	  message = Message.find(message_id)
	  render json: message
  end

	private

	def message_params
		params.permit(:user_id, :friendship_id, :content)
	end
end
