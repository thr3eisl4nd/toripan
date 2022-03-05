require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品登録' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item, user_id: @user.id)
    end

      context '商品登録ができるとき' do
        it '商品画像が1枚, 商品名, 商品説明, カテゴリーの情報, 商品の値段, 商品の在庫の情報があり、Adminユーザーであれば登録できる' do
        expect(@item).to be_valid
        end
      end

      context '商品登録ができないとき' do
        it '商品名が必須であること' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end

        it '商品名が2文字以下だと登録できない' do
          @item.name = 'レオ'
          @item.valid?
          expect(@item.errors.full_messages).to include("Name is too short (minimum is 3 characters)")
        end

        it '商品名が21文字以上だと登録できない' do
          @item.name = 'あ' * 21
          @item.valid?
          expect(@item.errors.full_messages).to include("Name is too long (maximum is 20 characters)")
        end

        it '商品説明が必須であること' do
          @item.text = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Text can't be blank")
        end

        it '商品説明が257文字以上だと登録できない' do
          @item.text = 'a' * 257
          @item.valid?
          expect(@item.errors.full_messages).to include("Text is too long (maximum is 256 characters)")
        end

        it 'カテゴリーで必須であること' do
          @item.category_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can‘t be blank.")
        end

        it '商品価格が必須であること' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it '商品価格が219円以下だと登録できない' do
          @item.price = 219
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is out of setting range.")
        end

        it '商品価格が5001円以上だと登録できない' do
          @item.price = 5001
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is out of setting range.")
        end

        it '在庫が必須であること' do
          @item.stock = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Stock can't be blank")
        end
      end
    end
end
