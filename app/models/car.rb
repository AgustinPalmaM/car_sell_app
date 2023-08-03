class Car < ApplicationRecord
  validates :registration, :brand, :version, :model, :color, :year, :price, :transmission, :traction, :fuel, presence: :true
end
