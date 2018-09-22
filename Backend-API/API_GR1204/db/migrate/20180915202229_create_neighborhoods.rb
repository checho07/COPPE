class CreateNeighborhoods < ActiveRecord::Migration[5.1]
  def change
    create_table :neighborhoods do |t|
      t.string :name_neihg
      t.string :zipCode_neigh

      t.timestamps
    end
  end
end
