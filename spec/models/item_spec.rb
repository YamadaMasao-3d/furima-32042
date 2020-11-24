require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品情報の保存' do
    context '新規出品登録がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@item).to be_valid
      end
      it "product_nameが入力されていれば登録できる" do
        @item.product_name = "aaaaaa"
        expect(@item).to be_valid
      end
      it "product_descriptionが入力されていれば登録できる" do
        @item.product_description  = "aaaaaa"
        expect(@item).to be_valid
      end
      it "category_idが入力されていれば登録できる" do
        @item.category_id  = 2
        expect(@item).to be_valid
      end
      it "product_condition_idが入力されていれば登録できる" do
        @item.product_condition_id = 2
        expect(@item).to be_valid
      end
      it "shipping_charge_idが入力されていれば登録できる" do
        @item.shipping_charge_id = 2
        expect(@item).to be_valid
      end
      it "shipping_area_idが入力されていれば登録できる" do
        @item.shipping_area_id = 2
        expect(@item).to be_valid
      end
      it "days_to_ship_idが入力されていれば登録できる" do
        @item.days_to_ship_id = 2
        expect(@item).to be_valid
      end
      it "product_priceが入力されていれば登録できる" do
        @item.product_price = 3000
        expect(@item).to be_valid
      end
    end

    context '新規出品登録がうまくいかないとき' do
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "product_nameが空だと登録できない" do
        @item.product_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it "product_nameが41文字以上だと登録できない" do
        @item.product_name = "a" * 41
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name is too long (maximum is 40 characters)")
      end
      it "product_descriptionが空だと登録できない" do
        @item.product_description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Product description can't be blank")
      end
      it "product_descriptionが1001文字以上だと登録できない" do
        @item.product_description = "a" * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include("Product description is too long (maximum is 1000 characters)")
      end
      it "category_idが空だと登録できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "category_idが0だと登録できない" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end
      it "product_condition_idが空だと登録できない" do
        @item.product_condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition can't be blank")
      end
      it "product_condition_idが0だと登録できない" do
        @item.product_condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition must be other than 0")
      end
      it "pshipping_charge_idが空だと登録できない" do
        @item.shipping_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end
      it "shipping_charge_idが0だと登録できない" do
        @item.shipping_charge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge must be other than 0")
      end
      it "shipping_area_idが空だと登録できない" do
        @item.shipping_area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end
      it "shipping_area_idが0だと登録できない" do
        @item.shipping_area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area must be other than 0")
      end
      it "days_to_ship_idが空だと登録できない" do
        @item.days_to_ship_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end
      it "days_to_ship_idが0だと登録できない" do
        @item.days_to_ship_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship must be other than 0")
      end
      it "product_priceが空だと登録できない" do
        @item.product_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product price can't be blank")
      end
      it "product_priceが空だと登録できない" do
        @item.product_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product price can't be blank")
      end
      it "product_priceが全角だと登録できない" do
        @item.product_price = "あああ"
        @item.valid?
        expect(@item.errors.full_messages).to include("Product price is not a number")
      end
    end
  end
end