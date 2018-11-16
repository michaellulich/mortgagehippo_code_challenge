class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def current_user
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

end
