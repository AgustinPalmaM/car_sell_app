class Car < ApplicationRecord
  has_one_attached :photo
  validates :registration, :brand, :version, :model, :color, :year, :price, :transmission, :traction, :fuel, presence: :true
end
