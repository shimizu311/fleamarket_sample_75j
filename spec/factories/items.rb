FactoryBot.define do

  factory :item, class: Item do
    name                  {"バッグ"}
    text                  {"素敵なバッグ"}
    category_id           {"1"}
    damage_id             {"1"}
    fee_id                {"1"}
    area_id               {"1"}
    send_date_id          {"1"}
    price                 {"1000"}
    brand                 {"aaa"}
    seller                { build(:seller) }
    after(:build) do |item|
      item.images << build(:image, item: item)
    end
  end

  factory :other_item, class: Item do
    name                  {"ぼうし"}
    text                  {"おしゃれなぼうし"}
    category_id           {"1"}
    damage_id             {"1"}
    fee_id                {"1"}
    area_id               {"1"}
    send_date_id          {"1"}
    price                 {"1000"}
    brand                 {"bbb"}
    seller                { build(:seller) }
    after(:build) do |item|
      item.images << build(:image, item: item)
    end
  end

  factory :item_no_picture, class: Item do
    name                  {"aaa"}
    text                  {"aaaa"}
    category_id           {"1"}
    damage_id             {"1"}
    fee_id                {"1"}
    area_id               {"1"}
    send_date_id          {"1"}
    price                 {"1000"}
    seller_id             {"1"}
    brand                 {""}
  end
end