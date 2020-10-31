class Item < ApplicationRecord

  belongs_to :user
  has_one :order
  has_one_attached :image


with_options presence: true do
  validates :name
  validates :text
  validates :category_id
  validates :stutus_id
  validates :shipping_fee_id
  validates :prefecture_id
  validates :scheduled_delivery_id
  validates :price
  validates :image
  end
end