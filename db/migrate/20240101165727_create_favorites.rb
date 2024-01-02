class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :car, null: false, foreign_key: true

      t.timestamps
    end
    add_index :favorites, [:user_id, :car_id], unique: true
    #Ex:- add_index("admin_users", "username")
  end
end
