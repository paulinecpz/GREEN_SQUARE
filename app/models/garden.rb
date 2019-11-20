class Garden < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price_per_day, presence: true, numericality: { only_integer: true }
  # mount_uploader :photo, PhotoUploader
end
