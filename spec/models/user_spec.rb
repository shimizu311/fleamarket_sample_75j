require 'rails_helper'
describe User do
  describe '#create' do

    it "全てのカラムがある場合は登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "passwordがあってもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "surnameがない場合は登録できないこと" do
      user = build(:user, surname: "")
      user.valid?
      expect(user.errors[:surname]).to include("を入力してください")
    end

    it "nameがない場合は登録できないこと" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "j_surnameがない場合は登録できないこと" do
      user = build(:user, j_surname: "")
      user.valid?
      expect(user.errors[:j_surname]).to include("を入力してください")
    end

    it "j_nameがない場合は登録できないこと" do
      user = build(:user, j_name: "")
      user.valid?
      expect(user.errors[:j_name]).to include("を入力してください")
    end

    it "yearがない場合は登録できないこと" do
      user = build(:user, year: "")
      user.valid?
      expect(user.errors[:year]).to include("を入力してください")
    end

    it "monthがない場合は登録できないこと" do
      user = build(:user, month: "")
      user.valid?
      expect(user.errors[:month]).to include("を入力してください")
    end

    it "dayがない場合は登録できないこと" do
      user = build(:user, day: "")
      user.valid?
      expect(user.errors[:day]).to include("を入力してください")
    end

    it "重複したemailが存在する場合は登録できないこと " do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "passwordが7文字以上であれば登録できること " do
      user = build(:user, password: "1234567", password_confirmation: "1234567")
      expect(user).to be_valid
    end

    it "passwordが6文字以下であれば登録できないこと " do
      user = build(:user, password: "123456", password_confirmation: "123456")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

    it "surnameが全角であれば登録できること " do
      user = build(:user, surname: "田中")
      expect(user).to be_valid
    end

    it "surnameが全角でなければ登録できないこと " do
      user = build(:user, surname: "ﾀﾅｶ")
      user.valid?
      expect(user.errors[:surname]).to include("は不正な値です")
    end

    it "nameが全角であれば登録できること " do
      user = build(:user, surname: "えり")
      expect(user).to be_valid
    end

    it "nameが全角でなければ登録できないこと " do
      user = build(:user, surname: "eri")
      user.valid?
      expect(user.errors[:surname]).to include("は不正な値です")
    end

    it "j_surnameが全角ひらがなであれば登録できること " do
      user = build(:user, j_surname: "たなか")
      expect(user).to be_valid
    end

    it "j_surnameが全角ひらがなでなければ登録できないこと " do
      user = build(:user, j_surname: "田中")
      user.valid?
      expect(user.errors[:j_surname]).to include("は不正な値です")
    end

    it "j_nameが全角ひらがなであれば登録できること " do
      user = build(:user, j_surname: "えり")
      expect(user).to be_valid
    end

    it "j_nameが全角ひらがなでなければ登録できないこと " do
      user = build(:user, j_surname: "エリ")
      user.valid?
      expect(user.errors[:j_surname]).to include("は不正な値です")
    end
  end
end