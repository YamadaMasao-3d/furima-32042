class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_find, only: [:show, :update, :edit, :destroy]
  before_action :redirect_top_page, only: [:edit, :destroy]
  before_action :sold_out, only: [:index]

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
    @purchase_history = PurchaseHistory.includes(@item.id)
  end

  def edit
  end

  def update
    if @item.update(item_data_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to item_path(@item.id)
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :product_price, :product_description, :category_id, :product_condition_id, :shipping_charge_id, :shipping_area_id, :days_to_ship_id).merge(user_id: current_user.id)
  end

  def item_data_params
    params.require(:item).permit(:image, :product_name, :product_price, :product_description, :category_id, :product_condition_id, :shipping_charge_id, :shipping_area_id, :days_to_ship_id)
  end


  def redirect_top_page
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def item_find
    @item = Item.find(params[:id])
  end

  def sold_out
    @purchase_history = PurchaseHistory.includes(:item)
  end


end
