class Addless < ApplicationRecord
  belongs_to :order

  with_options presence: true do
    validates :postal_code
    validates :city
    validates :house_number
    validates :building_name
    validates :telephone
  end

  with_options numericality: { other_than: 1, message: 'が選択されていません' } do
    validates :prefecture_id
  end
end
