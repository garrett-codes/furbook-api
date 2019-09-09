class FriendshipsController < ApplicationController
	def create
		friendship = Friendship.create(friendship_params)
		# byebug
		if friendship.valid?
			render json: {token: encode_token(friendship)}
		else
			render json: { errors: friendship.errors.full_messages }
		end
	end

	def index
		friendships = Friendship.all
		render json: friendships
	end

	def show
	  friendship_id = params[:id]
	  friendship = Friendship.find(friendship_id)
	  render json: friendship
  end

  def update
  	riendship_id = params[:id]
	  friendship = Friendship.find(friendship_id)
	  friendship.update(friendship_params)
  end

	# def show
	# 	@user = User.find(params[:id])
	# 	render :show
	# end

	private 

	def friendship_params
		params.permit(:user_id, :friend_user_id, :pending)
	end
end
