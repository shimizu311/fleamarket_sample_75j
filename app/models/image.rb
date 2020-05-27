class Image < ApplicationRecord
  belongs_to :item

  mount_uploaders :image_url, ImagesUploader
end
