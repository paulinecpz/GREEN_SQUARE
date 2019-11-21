class Garden < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price_per_day, presence: true, numericality: { only_integer: true }
  # mount_uploader :photo, PhotoUploader

  # include PgSearch::Model
  # pg_search_scope :search_by_address_and_name,
  #   against: [:address, :name],
  #   using: {
  #     tsearch: { prefix: true }
  #   }
end
