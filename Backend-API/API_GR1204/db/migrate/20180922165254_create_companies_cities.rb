class CreateCompaniesCities < ActiveRecord::Migration[5.1]
  def change
    create_table :companies_cities do |t|
      t.references :company, foreign_key: true
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
