require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
    sleep(1)
  end

  describe '商品購入' do
    context '購入がうまくいくとき' do
      it '必要事項が揃っていれば購入できる' do
        expect(@order).to be_valid
      end
      it 'building_nameが空でも購入できる' do
        building_name = nil
        expect(@order).to be_valid
      end
    end
    context '購入がうまく行かないとき' do
      it 'postal_codeが空だと購入できない' do
        @order.postal_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_caodeにハイフンがないと購入できない' do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code is invalid')
      end
      it 'prefectures_idが0だと購入できない' do
        @order.prefectures_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include('Prefectures must be other than 0')
      end
      it 'municipallyが空だと購入できない' do
        @order.municipally = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipally can't be blank")
      end
      it 'addressが空だと購入できない' do
        @order.address = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが12桁以上だと購入できない' do
        @order.phone_number = '090123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
      it 'tokenが空だと購入できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
