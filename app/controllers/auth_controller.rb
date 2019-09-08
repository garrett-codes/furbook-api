class AuthController < ApplicationController
	skip_before_action :authorized, only: :login
	
	def login
		user = User.find_by(username: params[:username])
				# byebug

		is_authenticated = user.authenticate(params[:password])

		if is_authenticated
			# payload = { user_id: user.id }

			# token = JWT.encode payload, 'secret', 'HS256'
			
			render json: {token: encode_token(user)}
		else
			render json: {error: "Wrong username and/or password. Sorry!"}
		end
	end
end
