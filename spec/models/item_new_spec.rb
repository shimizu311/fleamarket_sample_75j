require 'rails_helper'
RSpec.describe Item, type: :model do
  describe '#create' do

    before do
      @item             = build(:item)
      @image            = build(:image)
      @item_no_picture  = build(:item_no_picture)
    end

    it "画像が空の場合は登録できないこと" do
      item_no_picture = @item_no_picture
      item_no_picture.valid?
      expect(item_no_picture.errors[:images]).to include("を入力してください")
    end

    it "商品名が空の場合は登録できないこと" do
      item = @item
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "商品コメントが空の場合は登録できないこと" do
      item = @item
      item = build(:item, text: "")
      item.valid?
      expect(item.errors[:text]).to include("を入力してください")
    end

    it "カテゴリーが選択されてなければ登録できないこと" do
      item = @item
      item = build(:item, category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("を入力してください")
    end

    it "商品の状態が選択されてなければ登録できないこと" do
      item = @item
      item = build(:item, damage_id: "")
      item.valid?
      expect(item.errors[:damage_id]).to include("を入力してください")
    end

    it "配送料の負担が選択されてなければ登録できないこと" do
      item = @item
      item = build(:item, fee_id: "")
      item.valid?
      expect(item.errors[:fee_id]).to include("を入力してください")
    end

    it "発送元の地域が選択されてなければ登録できないこと" do
      item = @item
      item = build(:item, area_id: "")
      item.valid?
      expect(item.errors[:area_id]).to include("を入力してください")
    end

    it "発送までの日数が選択されてなければ登録できないこと" do
      item = @item
      item = build(:item, send_date_id: "")
      item.valid?
      expect(item.errors[:send_date_id]).to include("を入力してください")
    end

    it "商品価格が空の場合は登録できないこと" do
      item = @item
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    it "seller_idがnullの場合は登録できないこと" do
      item = @item
      item = build(:item, seller_id: "null")
      item.valid?
      expect(item.errors[:seller_id])
    end

    it "商品名が40文字であれば登録できること" do
      item = @item
      item = build(:item, name: "a" * 40)
      item.valid?
      expect(item[:name])
    end

    it "商品名が41文字であれば登録できないこと" do
      item = @item
      item = build(:item, name: "a" * 41)
      item.valid?
      expect(item.errors[:name]).to include("は40文字以内で入力してください")
    end

    it "商品コメントが1000文字であれば登録できること" do
      item = @item
      item = build(:item, text: "a" * 1000)
      expect(item[:text])
    end

    it "商品コメントが1001文字であれば登録できないこと" do
      item = @item
      item = build(:item, text: "a" * 1001)
      expect(item.errors[:text])
    end

    it "商品価格が数値以外の場合は登録できないこと" do
      item = @item
      item = build(:item, price: "ああああ")
      item.valid?
      expect(item.errors[:price]).to include("は数値で入力してください")
    end

    it "商品価格が299円の場合は登録できないこと" do
      item = @item
      item = build(:item, price: 299)
      item.valid?
      expect(item.errors[:price]).to include("は300以上の値にしてください")
    end

    it "商品価格が300円の場合は登録できること" do
      item = @item
      item = build(:item, price: 300)
      item.valid?
      expect(item[:price])
    end

    it "商品価格が9999999円の場合は登録できること" do
      item = @item
      item = build(:item, price: 9999999)
      item.valid?
      expect(item[:price])
    end

    it "商品価格が10000000円の場合は登録できないこと" do
      item = @item
      item = build(:item, price: 10000000)
      item.valid?
      expect(item.errors[:price]).to include("は9999999以下の値にしてください")
    end

    it "必須内容が入っていれば登録できること" do
      item = @item
      item.valid?
      expect(item)
    end
  end
end

