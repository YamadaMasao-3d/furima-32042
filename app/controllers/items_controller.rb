class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :new, :create, :edit]
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

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item.user_id)
    else
      render :new
    end
  end

  def edit
    if user_signed_in?
      @item = Item.find(params[:id])
    else
      redirect_to new_user_session_path
    end
  end

  def update
    @item = Item.find(params[:id])
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

  def move_to_index
    item = Item.find(params[:id])
    redirect_to action: :index unless user_signed_in? && current_user.id == item.user_id
  end
end
