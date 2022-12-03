require 'rails_helper'

RSpec.describe Item, type: :model do
    before do
     @item = FactoryBot.build(:item)
    end

    describe '商品出品機能' do
      context '商品出品できるとき' do
        it '全ての項目が入力されていれば出品できる' do
          expect(@item).to be_valid
        end
      end

        context '商品出品できないとき' do
          it '商品画像が空では登録できないこと' do
            @item.image = nil
            @item.valid?
            expect(@item.errors.full_messages).to include("Image can't be blank")
          end
          it '商品名が空では登録できないこと' do
            @item.item_name = ''
            @item.valid?
            expect(@item.errors.full_messages).to include("Item name can't be blank")
          end
          it '商品の説明が空では登録できないこと' do
            @item.description = ''
            @item.valid?
            expect(@item.errors.full_messages).to include("Description can't be blank")
          end
          it 'カテゴリーが空では登録できないこと' do
            @item.category_id = 1
            @item.valid?
            expect(@item.errors.full_messages).to include("Category can't be blank")
          end
          it '商品の状態が空では登録できないこと' do
            @item.condition_id = 1
            @item.valid?
            expect(@item.errors.full_messages).to include("Condition can't be blank")
          end
          it '配送料の負担が空では登録できないこと' do
            @item.shipping_fee_id = 1
            @item.valid?
            expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
          end
          it '発送元の地域が空では登録できないこと' do
            @item.ship_address_id = 1
            @item.valid?
            expect(@item.errors.full_messages).to include("Ship address can't be blank")
          end
          it '発送までの日数が空では登録できないこと' do
            @item.shipping_day_id = 1
            @item.valid?
            expect(@item.errors.full_messages).to include("Shipping day can't be blank")
          end
          it '販売価格が空では登録できないこと' do
            @item.price = nil
            @item.valid?
            expect(@item.errors.full_messages).to include("Price can't be blank")
          end
          it '販売価格が半角数値であること' do
            @item.price = '２０００'
            @item.valid?
            expect(@item.errors.full_messages).to include("Price Out of setting range")
          end
          it '販売価格が¥300以上であること' do
            @item.price = 290
            @item.valid?
            expect(@item.errors.full_messages).to include("Price Out of setting range")
          end
          it '販売価格が¥9,999,999以下であること' do
            @item.price = '100000000'
            @item.valid?
            expect(@item.errors.full_messages).to include("Price Out of setting range")
          end
          it 'userが紐付いていないと出品できない' do
            @item.user = nil
            @item.valid?
            expect(@item.errors.full_messages).to include('User must exist')
          end
        end
    end
end
