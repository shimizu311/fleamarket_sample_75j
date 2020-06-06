FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"0000000"}
    password_confirmation {"0000000"}
    surname               {"佐藤"}
    name                  {"彩花"}
    j_surname             {"さとう"}
    j_name                {"あやか"}
    year                  {2020}
    month                 {1}
    day                   {1}
  end

  factory :seller, class: User do
    id                    {1}
    nickname              {"abe"}
    email                 {"sss@gmail.com"}
    password              {"0000000"}
    password_confirmation {"0000000"}
    surname               {"佐藤"}
    name                  {"彩花"}
    j_surname             {"さとう"}
    j_name                {"あやか"}
    year                  {2020}
    month                 {1}
    day                   {1}
  end

end