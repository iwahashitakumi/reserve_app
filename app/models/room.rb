class Room < ApplicationRecord
  mount_uploader :home_image, HomeImageUploader
end
