class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find, only: [:index]
  before_action :redirect_top_page, only: [:index]

  def index
    @purchase_history = PurchaseHistory.includes(:item) 
    @buyer_info = BuyerInfo.new
    @purchase_history.each do |purchase_history|
      if @item.id == purchase_history.item_id 
        redirect_to root_path
      end
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @buyer_info = BuyerInfo.new(buyer_info_params)
    if @buyer_info.valid?
      pay_item
      @buyer_info.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def buyer_info_params
    item = Item.find(params[:item_id])
    params.require(:buyer_info).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item[:product_price],  
      card: buyer_info_params[:token],   
      currency: 'jpy'                
    )
  end

  def redirect_top_page
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

end
