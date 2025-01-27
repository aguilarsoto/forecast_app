class CreateLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :locations do |t|
      t.string :address
      t.decimal :latitude
      t.decimal :longitude
      t.string :zipcode

      t.timestamps
    end
  end
end
