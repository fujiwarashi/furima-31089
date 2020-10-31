class Item < ApplicationRecord

  belongs_to :item
  has_one :order

end