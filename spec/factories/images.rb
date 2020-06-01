FactoryBot.define do
  
  factory :image, class: Image do
    item_id    {"1"}
    image_url  {"a"}
    association :item, factory: :item
  end
end