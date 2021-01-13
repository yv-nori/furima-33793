class OrdersController < ApplicationController
  before_action -> { @order_address = OrderAddress.new(item_id: params[:item_id]) }, only: [:index]
  before_action -> { @order_address = OrderAddress.new(order_address_params) },      only: [:create]
  before_action :authenticate_user!, only: [:index, :create]

  def index
  end

  def create
    if @order_address.valid?
      @order_address.save
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: order_address_params[:price],
        card: order_address_params[:token],
        currency: 'jpy'
      )
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_address_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :building, :phone_number, :addresses, :price).merge(token: params[:token], price: Item.find(params[:item_id]).price, user_id: current_user.id, item_id: params[:item_id])
  end

end
