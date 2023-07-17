class Room < ApplicationRecord
  mount_uploader :home_image, Home_imageUploader
end
