class Booking < ApplicationRecord
  belongs_to :garden
  belongs_to :user
  has_one :review
end
