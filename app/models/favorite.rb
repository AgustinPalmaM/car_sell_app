class Favorite < ApplicationRecord
  validates :user, uniqueness: { scope: :car }
  belongs_to :user
  belongs_to :car
end
