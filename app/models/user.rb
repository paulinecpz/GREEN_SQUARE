class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :gardens
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :email, presence: true, uniqueness: true
  mount_uploader :avatar, PhotoUploader

end
