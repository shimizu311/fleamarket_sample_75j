FactoryBot.define do

  factory :image, class: Image do
    item_id    {"1"}
    image_url  {File.open("#{Rails.root}/app/assets/images/sample1.png")}
    association :item, factory: :item
  end
end