require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    @purchase_form = FactoryBot.build(:purchase_form)
  end



   describe '商品購入機能' do
      context '商品購入ができるとき' do
        it '全ての値が正しく入力されていれば購入できる' do
          expect(@purchase_form).to be_valid
        end
        it 'building_nameは空でも購入できる' do
          @purchase_form.building_name = ''
          expect(@purchase_form).to be_valid
        end
        it 'phone_numberが10桁のとき' do
          @purchase_form.phone_number = '0123456789'
          expect(@purchase_form).to be_valid
        end
        it 'phone_numberが11桁のとき' do
          @purchase_form.phone_number = '01234567890'
          expect(@purchase_form).to be_valid
        end
      end


      context '商品購入ができないとき' do
        it 'post_codeが無いとき' do
          @purchase_form.post_code = ''
          @purchase_form.valid?
          expect(@purchase_form.errors.full_messages).to include("Post code can't be blank")
        end
        it 'post_codeにハイフンが無いとき' do
          @purchase_form.post_code = '1234567'
          @purchase_form.valid?
          expect(@purchase_form.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
        end
        it 'prefecture_idが無いとき' do
          @purchase_form.prefecture_id = 1
          @purchase_form.valid?
          expect(@purchase_form.errors.full_messages).to include('Prefecture must be other than 1')
        end
        it 'cityが空のとき' do
          @purchase_form.city = ''
          @purchase_form.valid?
          expect(@purchase_form.errors.full_messages).to include("City can't be blank")
        end
        it 'house_numberが空のとき' do
          @purchase_form.house_number = ''
          @purchase_form.valid?
          expect(@purchase_form.errors.full_messages).to include("House number can't be blank")
        end
        it 'phone_numberが空のとき' do
          @purchase_form.phone_number = ''
          @purchase_form.valid?
          expect(@purchase_form.errors.full_messages).to include("Phone number can't be blank")
        end
        it 'phone_numberが10桁または11桁では無いとき' do
          @purchase_form.phone_number = '090123456789'
          @purchase_form.valid?
          expect(@purchase_form.errors.full_messages).to include("Phone number Input only number")
        end
        it 'tokenが空のとき' do
          @purchase_form.token = ''
          @purchase_form.valid?
          expect(@purchase_form.errors.full_messages).to include("Token can't be blank")
        end
      end
    end
  end