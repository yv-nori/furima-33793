class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    
  end
  def new
    @item = Item.new
  end

  def create
    @items = Item.new(items_params)
  end

  private
  def items_params
    params.require(:item).permit(
      :name, :info, :category_id,
      :sales_status_id, :shipping_fee_status_id,
      :prefecture_id, :scheduled_delivery_id,
      :price).merge(sale_user_id: current_user.id)
  end
end
