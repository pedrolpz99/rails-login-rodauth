
require 'jwt'

class AuthenticationController < ApplicationController
#   def login
#     user = User.find_by(email: params[:email])
    
#     if user && user.authenticate(params[:password])
#       token = generate_jwt_token(user)
      
#       render json: { token: token }, status: :ok
#     else
#       render json: { error: 'Invalid credentials' }, status: :unauthorized
#     end
#   end

#   private

#   def generate_jwt_token(user)
#     payload = {
#       user_id: user.id,
#       exp: Time.now.to_i + 3600 
#     }
    
#     jwt_secret = Rails.application.credentials.jwt_secret_key
#     JWT.encode(payload, jwt_secret, 'HS256')
#   end
end

