class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :registration
      t.string :brand
      t.string :version
      t.string :model
      t.integer :year
      t.string :color
      t.integer :price
      t.integer :credit_price
      t.string :transmission
      t.string :traction
      t.string :fuel

      t.timestamps
    end
  end
end
