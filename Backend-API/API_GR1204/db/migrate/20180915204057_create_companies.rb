class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name_company
      t.string :nit_company
      t.string :address_company
      t.string :email_company
      t.string :phone_company
      t.references :entity_type, foreign_key: true

      t.timestamps
    end
  end
end
