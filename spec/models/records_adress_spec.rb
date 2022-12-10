require 'rails_helper'

RSpec.describe RecordAdress, type: :model do
    before do
      @record_adress = FactoryBot.build(:record_adress)
    end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@record_adress).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it '郵便番号が空だと保存できないこと' do
        @record_adress.postcode = ''
        @record_adress.valid?
        expect(@record_adress.errors.full_messages).to include("Postcode can't be blank")
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @record_adress.postcode = 1234567
        @record_adress.valid?
        expect(@record_adress.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
      end
      it '都道府県が空では保存できないこと' do
        @record_adress.ship_address_id = 1
        @record_adress.valid?
        expect(@record_adress.errors.full_messages).to include("Ship address can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @record_adress.city = ''
        @record_adress.valid?
        expect(@record_adress.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @record_adress.block = ''
        @record_adress.valid?
        expect(@record_adress.errors.full_messages).to include("Block can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @record_adress.phone_number = nil
        @record_adress.valid?
        expect(@record_adress.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンがあると保存できないこと' do
        @record_adress.phone_number = '123 - 1234 - 1234'
        @record_adress.valid?
        expect(@record_adress.errors.full_messages).to include("Phone number is invalid.")
      end
      it '電話番号が12桁以上あると保存できないこと' do
        @record_adress.phone_number = 1234567890123
        @record_adress.valid?
        expect(@record_adress.errors.full_messages).to include("Phone number is invalid.")
      end
      it '電話番号が全角だと保存できないこと' do
        @record_adress.phone_number = '１２３４５６７８９０１'
        @record_adress.valid?
        expect(@record_adress.errors.full_messages).to include("Phone number is invalid.")
      end
    end
  end
end