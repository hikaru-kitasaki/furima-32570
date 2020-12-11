require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end    

  describe '商品出品登録' do
    context '商品出品ができる時' do
      it '必要事項が入力されていれば登録できる' do
        expect(@item).to be_valid
      end
    end
    
    context '商品出品ができない時' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'product_nameが空だと登録できない' do
        @item.product_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it 'product_descriptionが空だと登録できない' do
        @item.product_description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product description can't be blank")
      end
      it 'category_idが1だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'status_idが1だと登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it 'shipping_charges_idが1だと登録できない' do
        @item.shipping_charges_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charges must be other than 1")
      end
      it 'shipping_area_idが1だと登録できない' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area must be other than 1")
      end
      it 'days_to_ship_idが1だと登録できない' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship must be other than 1")
      end
      it 'selling_priceが空だと登録できない' do
        @item.selling_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price is invalid")
      end
      it 'selling_priceが299円以下だと登録できない' do
        @item.selling_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price must be greater than or equal to 300")
      end
      it 'selling_Priceが10000000円以上だと登録できない' do
        @item.selling_price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price must be less than or equal to 9999999")
      end
      it 'userが紐付いていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end    
end
