class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :people, presence: true
  validates :start_date, comparison: { greater_than: :end_date }

  def sum_of_days
    (end_date.to_date - start_date.to_date).to_i
  end
  
  def sum_of_price
    (room.money * people * sum_of_days).to_i
  end
end
