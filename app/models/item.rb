class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :user
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :days_to_ship
  
  with_options presence: true do
  validates :image
  validates :product_name, length:{maximum:40}
  validates :product_description, length:{maximum:1000}
  validates :product_price, numericality:{ only_integer:true, with:/\A[-]?[0-9]+(\.[0-9]+)?\z/}
  validates_inclusion_of :product_price,in: 300..9999999
  end
  validates :category_id, presence: true, numericality: { other_than: 0}
  validates :product_condition_id, presence: true, numericality: { other_than: 0}
  validates :shipping_charge_id, presence: true, numericality: { other_than: 0}
  validates :shipping_area_id, presence: true, numericality: { other_than: 0}
  validates :days_to_ship_id, presence: true, numericality: { other_than: 0}
end  