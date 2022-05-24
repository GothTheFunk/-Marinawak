class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :boat

  after_create :set_price

  scope :pending, ->{ where(status: "pending") }
  scope :accepted, ->{ where(status: "accepted") }
  scope :denied, ->{ where(status: "denied") }

  def set_price
    self.amount = (self.end_date - self.start_date) * self.boat.price_per_day
    self.save
  end


end
