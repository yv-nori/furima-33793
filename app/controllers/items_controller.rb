class ItemsController < ApplicationController
  # require './app/common_class/create_instance'
  before_action -> { @item  = Item.find(params[:id]) },         only: [:show, :edit, :update, :destroy]
  before_action -> { @items  = Item.order("created_at DESC") }, only: [:index]
  before_action -> { @item  = Item.new },                       only: [:new]
  before_action -> { @item  = Item.new(items_params) },         only: [:create]

  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :move_to_index,      only: [:edit, :update, :destroy]
  def move_to_index
    redirect_to root_path if current_user.id != Item.find(params[:id]).user.id
    # redirect_to root_path if Item.find(params[:id]).order.present?
  end

  def index
  end

  def new
  end

  def show
  end

  def create
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(items_params)
      redirect_to action: :show
    else
      create_item("params")
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def items_params
    params.require(:item).permit(
      :image, :name, :info, :category_id,
      :sales_status_id, :shipping_fee_status_id,
      :prefecture_id, :scheduled_delivery_id,
      :price
    ).merge(user_id: current_user.id)
  end

end
