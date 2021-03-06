require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '商品購入機能' do
    context '購入できる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '購入できない場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code は123-4567形式で入力して下さい')
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.postal_code = '0000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code は123-4567形式で入力して下さい')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture が選択されていません')
      end
      it 'prefectureについての情報が選択されてなければ保存できないこと' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture が選択されていません')
      end
      it 'cityが空だと保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと保存できないこと' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'telephoneが空だと保存できないこと' do
        @order_address.telephone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone は09012345678形式で入力して下さい')
      end
      it 'telephoneが全角数字だと保存できないこと' do
        @order_address.telephone = '０９０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone は09012345678形式で入力して下さい')
      end
      it 'telephoneにハイフンが含まれていると保存できないこと' do
        @order_address.telephone = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone は09012345678形式で入力して下さい')
      end
      it 'telephoneが12桁以上だと保存できないこと' do
        @order_address.telephone = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone は09012345678形式で入力して下さい')
      end
      it 'tokenが空では登録できないこと' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
