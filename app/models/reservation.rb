class Reservation < ActiveRecord::Base
  belongs_to :restaurant
  validates :email, presence: true
  validates :requested_date, presence: true
end
