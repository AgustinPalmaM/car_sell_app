class AddNullFalseToCar < ActiveRecord::Migration[7.0]
  def change
    change_column_null :cars, :registration, false
    change_column_null :cars, :brand, false
    change_column_null :cars, :version, false
    change_column_null :cars, :model, false
    change_column_null :cars, :year, false
    change_column_null :cars, :color, false
    change_column_null :cars, :price, false
    change_column_null :cars, :transmission, false
    change_column_null :cars, :traction, false
    change_column_null :cars, :fuel, false
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
