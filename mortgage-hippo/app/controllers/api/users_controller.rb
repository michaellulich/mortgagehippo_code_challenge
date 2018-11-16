class Api::UsersController < ApplicationController
  before_action :authenticate_admin

  def index
    @users = User.all
    render "index.json.jbuilder"
  end

  def create
    @user = User.new(
    name: params[:name],
    email: params[:email],
    password: params[:password],
    api_key: params[:api_key],
    admin: params[:admin]
  )
    if @user.save
      render json: {message: 'User created successfully'}, status: :created
    else
      render json: {errors: @user.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    render "show.json.jbuilder"
  end
end
