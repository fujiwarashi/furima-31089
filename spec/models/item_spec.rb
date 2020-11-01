require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'ユーザー新規登録' do
    context '出品できる場合' do
      it '全て正しい値が入っていれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できない場合' do
      it '商品画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が必須であること' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が必須であること' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'カテゴリーの情報が必須であること' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Category が選択されていません')
      end
      it 'カテゴリーの情報が選択されていないといけない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category が選択されていません')
      end
      it '商品の状態についての情報が必須であること' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Status が選択されていません')
      end
      it '商品の状態についての情報が選択されていないといけない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status が選択されていません')
      end
      it '配送料の負担についての情報が必須であること' do
        @item.shipping_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee が選択されていません')
      end
      it '配送料の負担についての情報が選択されていないといけない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee が選択されていません')
      end
      it '発送元の地域についての情報が必須であること' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture が選択されていません')
      end
      it '発送元の地域についての情報が選択されてないといけない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture が選択されていません')
      end
      it '発送までの日数についての情報が必須であること' do
        @item.scheduled_delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Scheduled delivery が選択されていません')
      end
      it '発送までの日数についての情報が選択されてないといけない' do
        @item.scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Scheduled delivery が選択されていません')
      end
      it '価格についての情報が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Price には¥300~¥9,999,999の間で半角数字を入力してください')
      end
      it '価格が、¥300以上であること' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price には¥300~¥9,999,999の間で半角数字を入力してください')
      end
      it '価格が、¥9,999,999以下であること' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price には¥300~¥9,999,999の間で半角数字を入力してください')
      end
      it '販売価格は半角数字のみ保存可能であること' do
        @item.price = '０'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price には¥300~¥9,999,999の間で半角数字を入力してください')
      end
    end
  end
end
