class OrdersController < ApplicationController
  before_action -> { create_order_address("new") },    only: [:index]
  before_action -> { create_order_address("params") }, only: [:create]
  def create_order_address(method)
    case method
      when "new"    then @order_address = OrderAddress.new
      when "params" then @order_address = OrderAddress.new(order_address_params)
    end
  end

  def index
    @item = Item.find(params[:item_id])
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
