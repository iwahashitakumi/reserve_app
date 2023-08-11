class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  validates :home_name, presence: true
  validates :home_type, presence: true
  validates :address, presence: true
  validates :money, presence: true
  validates :money, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 9_999_999 },
                  format: { with: /\A[0-9]+\z/ }
  mount_uploader :home_image, HomeImageUploader
  def self.ransackable_attributes(auth_object = nil)
    ["address","home_name","home_type"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["home_name", "home_type"]
  end
end