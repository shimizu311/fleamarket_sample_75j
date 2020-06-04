require 'rails_helper'

# RSpec.describe SnsCredential, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
describe SnsCredential do
  describe '#create' do
    
    it "SNS認証ができること" do
      sns = build(:sns_credential)
      sns.valid?
      expect(sns)
    end

    it "SNS認証にて登録がない場合、新規会員登録を行うこと" do
      sns = build(:sns_credential, provider: "", uid: "")
      sns.valid?
      expect(sns.errors)
    end
  end
end