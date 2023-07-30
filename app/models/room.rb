class Room < ApplicationRecord
  belongs_to :users
  has_many :reservations
  mount_uploader :home_image, HomeImageUploader
  def self.ransackable_attributes(auth_object = nil)
    ["address"]
  end
end
