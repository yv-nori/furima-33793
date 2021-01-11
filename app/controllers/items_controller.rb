class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  # def show
  #   @item = Item.find(params[:id])
  # end

  def create
    @item = Item.new(items_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  # def edit
  #   @item = Item.find(params[:id])
  # end

  # def update
  #   item = Item.find(params[:id])
  #   if item.update(items_params)
  #     redirect_to action: :show
  #   else
  #     @item = Item.new(items_params)
  #     render :edit
  #   end
  # end

  # def destroy
  #   item = Item.find(params[:id])
  #   item.destroy
  #   redirect_to root_path
  # end

  private

  def items_params
    params.require(:item).permit(
      :image, :name, :info, :category_id,
      :sales_status_id, :shipping_fee_status_id,
      :prefecture_id, :scheduled_delivery_id,
      :price
    ).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path if current_user.id != Item.find(params[:id]).user.id
    redirect_to root_path if Item.find(params[:id]).order.present?
  end
end
