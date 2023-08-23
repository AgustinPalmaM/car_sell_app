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
require "test_helper"

class CarTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
