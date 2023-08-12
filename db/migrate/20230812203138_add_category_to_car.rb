class AddCategoryToCar < ActiveRecord::Migration[7.0]
  def change
    add_reference :cars, :category, foreign_key: true
  end
end
