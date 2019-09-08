class UsersController < ApplicationController
skip_before_action :authorized, only: :create
	def create
		user = User.create(user_params)
		# byebug
		if user.valid?
			render json: {token: encode_token(user)}
		else
			render json: { errors: user.errors.full_messages }
		end
	end

	def index
		users = User.all
		render json: users
	end

	def show
	  user_id = params[:id]
	  user = User.find(user_id)
	  render json: user
  end

	# def show
	# 	@user = User.find(params[:id])
	# 	render :show
	# end

	def profile
		render json: current_user
	end

	private 

	def user_params
		params.permit(:username, :password, :first_name, :last_name, :email)
	end
end
