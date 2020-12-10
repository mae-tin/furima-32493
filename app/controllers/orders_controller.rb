class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :redirect_check, only: [:index]
  
  def index
    binding.pry
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def redirect_check
    if @item.user_id == current_user.id || @item.order.present?
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_address_params
    params.require(:order_address).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number, :item_id).merge(user_id: current_user.id,item_id: params[:item_id])
  end
end