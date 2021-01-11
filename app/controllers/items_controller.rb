class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(items_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end

  def destroy

  end

  private
  def items_params
    params.require(:item).permit(
      :image, :name, :info, :category_id,
      :sales_status_id, :shipping_fee_status_id,
      :prefecture_id, :scheduled_delivery_id,
      :price).merge(sale_user_id: current_user.id)
  end
end
