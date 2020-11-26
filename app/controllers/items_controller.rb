class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :item_find, only: [:show, :update, :edit]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item.user_id)
    else
      render :new
    end
  end

  def show
  end

  def edit
    if user_signed_in?
      @item
    else
      redirect_to new_user_session_path
    end
  end

  def update
    if @item.update(item_data_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :product_price, :product_description, :category_id, :product_condition_id, :shipping_charge_id, :shipping_area_id, :days_to_ship_id).merge(user_id: current_user.id)
  end

  def item_data_params
    params.require(:item).permit(:image, :product_name, :product_price, :product_description, :category_id, :product_condition_id, :shipping_charge_id, :shipping_area_id, :days_to_ship_id)
  end

  def item_find
    @item = Item.find(params[:id])
  end

end
