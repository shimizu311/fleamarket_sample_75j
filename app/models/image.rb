class Image < ApplicationRecord
  belongs_to :item
  # validates :image_url, presence: true

  mount_uploader :image_url, ImagesUploader
end
