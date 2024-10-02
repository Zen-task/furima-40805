require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)   
    end
    
    context '内容に問題がない場合' do
      it '全ての情報が正しく入力されていれば保存できること' do
        sleep(0.1) # スリープを追加
        expect(@order_address).to be_valid
      end

      it 'buildingが空でも保存できること' do
        sleep(0.1) # スリープを追加
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空では保存できないこと' do
        sleep(0.1) # スリープを追加
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        sleep(0.1) # スリープを追加
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code はハイフンを含めてください（例000-0000）")
      end

      it 'prefecture_idを選択していないと保存できないこと' do
        sleep(0.1) # スリープを追加
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture を選択してください")
      end

      it 'cityが空では保存できないこと' do
        sleep(0.1) # スリープを追加
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'blockが空では保存できないこと' do
        sleep(0.1) # スリープを追加
        @order_address.block = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Block can't be blank")
      end

      it 'phone_numberが空では保存できないこと' do
        sleep(0.1) # スリープを追加
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_number全角数字の場合は保存できないこと' do
        sleep(0.1) # スリープを追加
        @order_address.phone_number = '０９０１２３４５６７８' 
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number は半角で10桁か11桁でハイフン含まず入力してください')
      end
      
      it 'phone_numberが9桁以下では保存できないこと' do
        sleep(0.1) # スリープを追加
        @order_address.phone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number は半角で10桁か11桁でハイフン含まず入力してください")
      end

      it 'phone_numberが12桁以上では保存できないこと' do
        sleep(0.1) # スリープを追加
        @order_address.phone_number = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number は半角で10桁か11桁でハイフン含まず入力してください")
      end

      it 'phone_numberにハイフンが含まれていると保存できないこと' do
        sleep(0.1) # スリープを追加
        @order_address.phone_number = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number は半角で10桁か11桁でハイフン含まず入力してください")
      end

      it 'user_idが空では保存できないこと' do
        sleep(0.1) # スリープを追加
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では保存できないこと' do
        sleep(0.1) # スリープを追加
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空では保存できないこと' do
        sleep(0.1) # スリープを追加
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end


    end
  end
end
