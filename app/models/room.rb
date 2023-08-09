class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations
  validates :home_name, presence: true
  validates :home_type, presence: true
  validates :address, presence: true
  validates :money, presence: true
  validates :money, numericality: true
  mount_uploader :home_image, HomeImageUploader
  def self.ransackable_attributes(auth_object = nil)
    ["address","home_name","home_type"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["home_name", "home_type"]
  end
end