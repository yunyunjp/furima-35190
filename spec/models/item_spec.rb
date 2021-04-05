require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '#create' do
    context '商品が出品できる時' do
      it 'すべての項目が存在すれば登録できること' do
        expect(@item).to be_valid
      end
    end
    
    context '商品が出品できない時' do
      it '商品画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が必須であること' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が必須であること' do
        @item.info = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'カテゴリーの情報が必須であること' do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it '商品の状態についての情報が必須であること' do
        @item.status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it '配送料の負担についての情報が必須であること' do
        @item.fee_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee must be other than 1")
      end
      it '発送元の地域についての情報が必須であること' do
        @item.delivery_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery must be other than 1")
      end
      it '販売価格についての情報が必須であること' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price is invalid", "Price is not a number")
      end
      it '販売価格は、¥300以上で保存可能であること' do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '販売価格は、¥9,999,999以下で保存可能であること' do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it '販売価格は半角数字のみ保存可能であること' do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
