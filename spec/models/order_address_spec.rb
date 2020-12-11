require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入機能' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end
    context '商品購入が成功するとき' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_address).to be_valid
      end
      it 'buildingが空でも保存できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '商品購入が失敗するとき' do
      it 'tokenが空では保存できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postcodeが空では保存できない' do
        @order_address.postcode = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postcodeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @order_address.postcode = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postcode Input correctly')
      end
      it 'prefectureが選択されていないと保存できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture select')
      end
      it 'cityが空では保存できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空では保存できない' do
        @order_address.block = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが空では保存できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが半角数値のみでないと保存できない' do
        @order_address.phone_number = '０９０１１１１２２２２'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number Input correctly')
      end
      it 'phone_numberが12桁以上だと保存できない' do
        @order_address.phone_number = '000001111122'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number Input correctly')
      end
      it 'user_idが紐づいていないと保存できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが紐づいていないと保存できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
