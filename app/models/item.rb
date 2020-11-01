class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery

  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :price, numericality: {
    with: /\A[0-9]+\z/, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
    message: 'には¥300~¥9,999,999の間で半角数字を入力してください'
  }

  with_options presence: true do
    validates :name
    validates :text
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end
end
