class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.string :name_city
      t.string :depart_city
      t.string :zipCode_city

      t.timestamps
    end
  end
end
