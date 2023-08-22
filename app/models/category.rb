class Category < ApplicationRecord
  has_many :cars, dependent: :restrict_with_exception
  validates :name, presence: true
end
