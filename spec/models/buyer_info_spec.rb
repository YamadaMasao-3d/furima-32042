require 'rails_helper'

RSpec.describe BuyerInfo, type: :model do
  before do
    @buyer_info = FactoryBot.build(:buyer_info)
  end

  describe '出品物の購入' do
    context '購入がうまくいくとき' do
      it 'すべての値が正しく入力されていれば購入できる' do
        expect(@buyer_info).to be_valid
      end
      it 'tokenを取得すると購入できる' do
        @buyer_info.token  = 'tok_abcdefghijk111111111111111111'
        expect(@buyer_info).to be_valid
      end
      it 'postal_codeを入力すると購入できる' do
        @buyer_info.postal_code  = '222-3333'
        expect(@buyer_info).to be_valid
      end
      it 'prefecture_idを入力すると購入できる' do
        @buyer_info.prefecture_id  = 1
        expect(@buyer_info).to be_valid
      end
      it 'municipalityを入力すると購入できる' do
        @buyer_info.municipality  = "札幌市白石区"
        expect(@buyer_info).to be_valid
      end
      it 'addressを入力すると購入できる' do
        @buyer_info.address = "東札幌1条3-3-8"
        expect(@buyer_info).to be_valid
      end
      it 'building_nameを入力すると購入できる' do
        @buyer_info.building_name = "コーポアイエム001"
        expect(@buyer_info).to be_valid
      end
      it 'building_nameが空でも購入できる' do
        @buyer_info.building_name = nil
        expect(@buyer_info).to be_valid
      end
      it 'phone_numberを入力すると購入できる' do
        @buyer_info.phone_number = "09011000011"
        expect(@buyer_info).to be_valid
      end
      it 'user_idを入力すると購入できる' do
        @buyer_info.user = 1
        expect(@buyer_info).to be_valid
      end
      it 'item_idを入力すると購入できる' do
        @buyer_info.item = 1
        expect(@buyer_info).to be_valid
      end
    end

    context '出品物購入がうまくいかないとき' do
      it 'tokenが空だと購入できない' do
        @buyer_info.token = nil
        @buyer_info.valid?
        expect(@buyer_info.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと購入できない' do
        @buyer_info.postal_code = nil
        @buyer_info.valid?
        expect(@buyer_info.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンが含まれないと購入できない' do
        @buyer_info.postal_code = "12345678"
        @buyer_info.valid?
        expect(@buyer_info.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが空だと購入できない' do
        @buyer_info.prefecture_id = nil
        @buyer_info.valid?
        expect(@buyer_info.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが0だと購入できない' do
        @buyer_info.prefecture_id = 0
        @buyer_info.valid?
        expect(@buyer_info.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it 'municipalityが空だと購入できない' do
        @buyer_info.municipality = nil
        @buyer_info.valid?
        expect(@buyer_info.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと購入できない' do
        @buyer_info.address = nil
        @buyer_info.valid?
        expect(@buyer_info.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @buyer_info.phone_number = nil
        @buyer_info.valid?
        expect(@buyer_info.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが11桁以内でないと購入できない' do
        @buyer_info.phone_number = "0907544567"
        @buyer_info.valid?
        expect(@buyer_info.errors.full_messages).to include("Phone number is invalid")
      end
      it 'user_idが空だと購入できない' do
        @buyer_info.user = nil
        @buyer_info.valid?
        expect(@buyer_info.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと購入できない' do
        @buyer_info.item = nil
        @buyer_info.valid?
        expect(@buyer_info.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end