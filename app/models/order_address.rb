class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone, :user_id, :token

  with_options presence: true do
    validates :city
    validates :house_number
    validates :token
  end

  with_options numericality: { other_than: 1, message: 'が選択されていません' } do
    validates :prefecture_id
  end
  
  with_options presence: true, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'は123-4567形式で入力して下さい'} do
    validates :postal_code
  end

  with_options presence: true, format: { with: /\A\d{10,11}\z/, message: 'は09012345678形式で入力して下さい'} do
    validates :telephone
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, telephone: telephone, order_id: order.id)
  end
end