class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def landing_page
    render :file => 'public/landing.html'
  end

  def current_user
    # User.find_by(api_key: params[:api_key])
    # User.find_by(id: params[:id])
    current_user = User.find_by(api_key: params[:api_key])
  end

  def authenticate_user
    unless current_user
      render json: {}, status: :unauthorized
    end
  end

  def authenticate_admin
    unless current_user && current_user.admin
      render json: {}, status: :unauthorized
    end
  end  




  # def current_user
  #   if request.headers['Authorization'].present?
  #     token = request.headers['Authorization'].split(' ').last
  #     begin
  #         decoded_token = JWT.decode(
  #           token,
  #           Rails.application.credentials.fetch(:secret_key_base),
  #           true,
  #           { algorithm: 'HS256' }
  #         )
  #         User.find_by(id: decoded_token[0]["user"])
  #       rescue JWT::ExpiredSignature
  #         nil
  #       end
  #   end
  # end

  # helper_method :current_user

  # def authenticate_user
  #   unless current_user
  #     render json: {}, status: :unauthorized
  #   end
  # end
end
