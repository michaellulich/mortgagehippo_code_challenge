class Api::SessionsController < ApplicationController
  # before_action :authenticate_user

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      jwt = JWT.encode(
        {
          user: user.id, # the data to encode
          exp: 24.hours.from_now.to_i # the expiration time
        },
        Rails.application.credentials.fetch(:secret_key_base), # the secret key
        'HS256' # the encryption algorithm
      )
      render json: {jwt: jwt, email: user.email, id: user.id}, status: :created
    else
      render json: {}, status: :unauthorized
    end
  end
end
