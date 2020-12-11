class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :redirect_check, only: [:edit, :destroy]

  def index
    @items = Item.includes(:user, :order).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :condition_id, :delivery_fee_id,
                                 :prefecture_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end

  def redirect_check
    redirect_to root_path if @item.user_id != current_user.id || @item.order.present?
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
