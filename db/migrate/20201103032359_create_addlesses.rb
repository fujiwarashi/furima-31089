class CreateAddlesses < ActiveRecord::Migration[6.0]
  def change
    create_table :addlesses do |t|
      t.string     :postal_code,   null: false
      t.integer    :prefecture_id, null: false
      t.string     :city,          null: false
      t.string     :houce_number,  null: false
      t.string     :building_name, null: false
      t.integer    :telephone,     null: false
      t.references :order,         foreign_key: true
      t.timestamps
    end
  end
end
