class ItemsController < ApplicationController

  def index
    #@items = Item.all 初期画面へ今後表示するため表記しています。
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

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :product_price, :product_description, :category_id, :product_condition_id, :shipping_charge_id, :shipping_area_id, :days_to_ship_id).merge(user_id: current_user.id)
  end


end
