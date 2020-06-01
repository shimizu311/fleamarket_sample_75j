require 'rails_helper'
describe UserAddress do
  describe '#create_user_address' do

    it "全てのカラムがある場合は登録できること" do
      user_address = build(:user_address)
      expect(user_address).to be_valid
    end

    # 入力必須項目についてvalidates presence: trueのチェック
    it "postal_codeがない場合は登録できないこと" do
      user_address = build(:user_address, postal_code: "")
      user_address.valid?
      expect(user_address.errors[:postal_code]).to include("を入力してください")
    end

    it "area_idがない場合は登録できないこと" do
      user_address = build(:user_address, area_id: "")
      user_address.valid?
      expect(user_address.errors[:area_id]).to include("を入力してください")
    end

    it "cityがない場合は登録できないこと" do
      user_address = build(:user_address, city: "")
      user_address.valid?
      expect(user_address.errors[:city]).to include("を入力してください")
    end

    it "house_numberがない場合は登録できないこと" do
      user_address = build(:user_address, house_number: "")
      user_address.valid?
      expect(user_address.errors[:house_number]).to include("を入力してください")
    end

    # 入力任意項目について、入力してなくても登録できるかチェック
    it "building_nameがない場合でも登録できること" do
      user_address = build(:user_address, building_name: "")
      expect(user_address).to be_valid
    end

    it "telがない場合でも登録できること" do
      user_address = build(:user_address, tel: "")
      expect(user_address).to be_valid
    end

    # postal_codeの桁数、正規表現のバリデーションチェック
    it "postal_codeが7文字であれば登録できること " do
      user_address = build(:user_address, postal_code: "1234567")
      expect(user_address).to be_valid
    end

    it "postal_codeが6文字以下であれば登録できないこと " do
      user_address = build(:user_address, postal_code: "123456")
      user_address.valid?
      expect(user_address.errors[:postal_code]).to include("は不正な値です")
    end

    it "postal_codeが8文字以下であれば登録できないこと " do
      user_address = build(:user_address, postal_code: "12345678")
      user_address.valid?
      expect(user_address.errors[:postal_code]).to include("は不正な値です")
    end

    it "postal_codeに数字以外の値があると登録できないこと " do
      user_address = build(:user_address, postal_code: "abcdefg")
      user_address.valid?
      expect(user_address.errors[:postal_code]).to include("は不正な値です")
    end

    # telの桁数、正規表現のバリデーションチェック
    it "telが10文字であれば登録できること " do
      user_address = build(:user_address, tel: "1234567890")
      expect(user_address).to be_valid
    end

    it "telが11文字であれば登録できること " do
      user_address = build(:user_address, tel: "12345678901")
      expect(user_address).to be_valid
    end

    it "telが9文字以下であれば登録できないこと " do
      user_address = build(:user_address, tel: "123456789")
      user_address.valid?
      expect(user_address.errors[:tel]).to include("は不正な値です")
    end

    it "telが12文字以上であれば登録できないこと " do
      user_address = build(:user_address, tel: "123456789012")
      user_address.valid?
      expect(user_address.errors[:tel]).to include("は不正な値です")
    end

    it "telに数字以外の値があると登録できないこと " do
      user_address = build(:user_address, tel: "abcdefghij")
      user_address.valid?
      expect(user_address.errors[:tel]).to include("は不正な値です")
    end
  end
end