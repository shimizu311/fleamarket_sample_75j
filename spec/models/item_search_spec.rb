require 'rails_helper'
describe Item do
  describe '#search' do

    before do
      @item             = build(:item)
      @item.save
      @other_item       = build(:other_item)
      @other_item.save
    end

    # "バッグ"で検索した場合
    it "@itemが検索結果に出てくること" do
      expect(Item.search("バッグ")).to include(@item)
    end

    it "@other_itemが検索結果に出てこないこと" do
      expect(Item.search("バッグ")).to_not include(@other_item)
    end

    # # "カバン"で検索した場合
    it "検索結果がないこと" do
      expect(Item.search("かばん")).to be_empty
    end

    # # 検索していない場合
    it "検索ワードがない場合、全レコードを出力すること" do
      expect(Item.search("")).to include(@item, @other_item)
    end
  end
end