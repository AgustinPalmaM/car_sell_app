class Car < ApplicationRecord
  validates :brand, :version, :model, :color, :year, :price, :transmission, :traction, :fuel, presence: :true
end
