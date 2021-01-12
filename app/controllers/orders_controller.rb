class OrdersController < ApplicationController
  before_action -> { @order_address = OrderAddress.new },   only: [:index]
  before_action -> { @item = Item.find(params[:item_id]) }, only: [:index]
  before_action -> { @order_address = OrderAddress.new(order_address_params) }, only: [:create]
   
  def index
  end

  def create
    if @order_address.save
      redirect_to root_path
    else
      create_order_address("params")
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def order_address_params
    @params = params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :building, :phone_number, :addresses)
          .merge(user_id: current_user.id)
    params.permit(:item_id).merge(@params)
  end

end
