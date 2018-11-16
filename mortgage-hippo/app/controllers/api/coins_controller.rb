class Api::CoinsController < ApplicationController
  before_action :authenticate_user

  def index
    @coins = Coin.all
    render "index.json.jbuilder"
  end

  def create
    @coin = Coin.new(
      value: params[:value],
      name: params[:name],
      # user_id: current_user.id
      )
    if @coin.save
      render "show.json.jbuilder"
    else
      render json: {errors: @coin.errors.full_messages},
        status: :unprocessable_entity
    end
  end

  def show
    id_input = params['id']
    @coin = Coin.find_by(id: id_input)
    render "show.json.jbuilder"
  end

  def update
    @coin = Coin.find_by(id: params[:id])
    @coin.name = params[:name] || @coin.name
    @coin.value = params[:value] || @coin.value

    if @coin.save
      render "show.json.jbuilder"
    else
      render json: {errors: @coin.errors.full_messages},
        status: :unprocessable_entity
    end 
  end

  def destroy
    @coin = Coin.find_by(id: params[:id])
    @coin.destroy
    render json: {message: "Coin deleted."}
  end

end
