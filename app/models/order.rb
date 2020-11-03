class Order < ApplicationRecord
  belongs_to_active_hash :prefecture

  belongs_to :user
  belongs_to :item
  has_one :addless
end
