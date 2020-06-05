class UserAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user, optional: true
  belongs_to_active_hash :area

  validates :area_id, :city, :house_number, presence: true
  validates :postal_code, presence: true, format: { with: /\A\d{7}\z/ }
  validates :tel, format: { with: /\A\d{10,11}\z/ }, if: :tel?

  def postal_code_display
    "〒#{self.postal_code.to_s.insert(3, "-")}"
  end

  def full_address
    self.area.name + self.city + self.house_number + self.building_name
  end
end