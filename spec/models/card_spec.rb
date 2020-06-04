require 'rails_helper'
describe Card do
  describe '#create' do

    it "全てのカラムがある場合は登録できること" do
      card = build(:card)
      card.valid?
      expect(card)
    end

    it "customer_idがない場合は登録できないこと" do
      card = build(:card, customer_id: "")
      card.valid?
      expect(card.errors[:customer_id]).to include("を入力してください")
    end

    it "card_idがない場合は登録できないこと" do
      card = build(:card, card_id: "")
      card.valid?
      expect(card.errors[:card_id]).to include("を入力してください")
    end
  end
end