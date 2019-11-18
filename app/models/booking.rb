class Booking < ApplicationRecord
  belongs_to :garden, dependent: :destroy
  belongs_to :user
  has_one :review
end
