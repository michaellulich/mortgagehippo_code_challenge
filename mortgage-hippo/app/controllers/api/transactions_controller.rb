class Api::TransactionsController < ApplicationController
  before_action :authenticate_user

  def index
    @transactions = Transaction.all
    render "index.json.jbuilder"
  end

  def create
    @transaction = Transaction.new(
      coin_id: params[:coin_id].to_i,
      withdrawl: params[:withdrawl],
      user_id: current_user.id
      )
    coin = Coin.find_by(id: params[:coin_id])
    current_coin_count = Transaction.coin_count[coin.name]
    # current_withdrawl = Transaction.find_by(withdrawl: params[:withdrawl])
    # p @transaction.withdrawl
    # return
    current_total = Transaction.total
    user = User.find_by(id: current_user.id)
    # user = User.where(admin: true)

    if user.admin && current_coin_count <= 4
      UserMailer.low_coin(user, current_coin_count, current_total).deliver
    end
    
    # if user && current_coin_count <= 4
    #   UserMailer.low_coin(user, current_coin_count, current_total).deliver
    # end

    if current_coin_count == 0 && @transaction.withdrawl == true
      render json: {message: "Can't withdraw, no coins of that amount."}
      return
    end

    # if current_coin_count == 4
    #   user = User.find_by(id: params[:id])
    #   p user
    # end
  
    if @transaction.save
      # if user && current_coin_count <= 4
      #   UserMailer.low_coin(user, current_coin_count, current_total).deliver
      # end
      render "show.json.jbuilder"
    else
      render json: {message: @transaction.errors.full_messages},
        status: :unprocessable_entity
    end
  end

  def show
    @transaction = Transaction.find_by(id: params[:id])
    render "show.json.jbuilder"
  end
end
