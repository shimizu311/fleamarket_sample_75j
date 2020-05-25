class Area < ApplicationRecord
  has_many :user_addresses
  has_many :items
end
