class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations
  mount_uploader :home_image, HomeImageUploader
  def self.ransackable_attributes(auth_object = nil)
    ["address","home_name","home_type"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["home_name", "home_type"]
  end
end