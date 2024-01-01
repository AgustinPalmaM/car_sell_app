# == Schema Information
#
# Table name: cars
#
#  id           :bigint           not null, primary key
#  registration :string           not null
#  brand        :string           not null
#  version      :string           not null
#  model        :string           not null
#  year         :integer          not null
#  color        :string           not null
#  price        :integer          not null
#  credit_price :integer
#  transmission :string           not null
#  traction     :string           not null
#  fuel         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  category_id  :bigint
#
class Car < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :whose_name_starts_with,
                  against: %i[brand model version],
                  using: {
                    tsearch: { prefix: true }
                  }

  validates :registration, :brand, :version, :model, :color, :year, :price, :transmission,
            :traction, :fuel, presence: true

  belongs_to :category
  belongs_to :user, default: -> { Current.user }

  has_one_attached :photo

  ORDER_BY = {
    newest: "created_at DESC",
    cheapest: "price ASC",
    expensive: "price DESC"
  }.freeze

  def owner?
    user_id == Current.user&.id
  end
end
