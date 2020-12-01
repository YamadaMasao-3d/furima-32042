class BuyerInfo
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :token, :user_id, :item_id

  with_options presence: true do
    validates :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :municipality
    validates :address
    validates :phone_number, format: {with: /\A0[5789]0[-(]?\d{4}[-)]?\d{4}\z/}
  end

  def save
  purchase_history = PurchaseHistory.create(user_id: user_id, item_id: item_id)
  ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_history_id: purchase_history.id)
  end
end
