FactoryBot.define do

  factory :user_address do
    postal_code    {"0000000"}
    area_id        {1}
    city           {"渋谷区"}
    house_number   {"神南1-12-16"}
    building_name  {"アジアビル8F"}
    tel            {"00000000000"}
  end

end