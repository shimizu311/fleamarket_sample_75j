FactoryBot.define do
  factory :category do
    id       {"3"}
    name     {"シャツ"}
    ancestry {"1/2"}

    factory :child_category do |f|
      f.parent { build(:category) }

      factory :parent_category do |g|
        g.parent { build(:child_category) }
      end
    end
  end

  factory :other_category, class: Category do
    id       {"4"}
    name     {"ぼうし"}
    ancestry {"1/2"}

    factory :other_child_category do |f|
      f.parent { build(:category) }

      factory :other_parent_category do |g|
        g.parent { build(:child_category) }
      end
    end
  end
end