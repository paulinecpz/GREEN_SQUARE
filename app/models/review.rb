class Review < ApplicationRecord
  belongs_to :booking

  validates :description, presence: true
  validates :rating, inclusion: { in: [1, 2, 3, 4, 5] }
end
