require 'rails_helper'
describe Item do
  describe '#create' do
    it "商品名が空の場合は登録できないこと" do
      item = Item.new(name: "", text: "aaaa", category_id: "1", damage_id: "1", fee_id: "1", area_id: "1", send_date_id: "1", price: "1000", images_attributes: [image_url: "a"], seller_id: "1")
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end
  end
end