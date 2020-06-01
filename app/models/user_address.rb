class UserAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user, optional: true
  belongs_to_active_hash :area

  validates :area_id, :city, :house_number, presence: true
  validates :postal_code, presence: true, format: { with: /\A\d{7}\z/ }
  validates :tel, format: { with: /\A\d{10,11}\z/ }, if: :tel?
end