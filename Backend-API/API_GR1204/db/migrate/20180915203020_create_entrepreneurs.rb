class CreateEntrepreneurs < ActiveRecord::Migration[5.1]
  def change
    create_table :entrepreneurs do |t|
      t.string :name_entre
      t.string :lastname_entre
      t.float :cc_entre
      t.float :phone_entre
      t.string :address_entre
      t.string :age_entre_int
      t.string :email_entre
      t.references :neighborhood, foreign_key: true

      t.timestamps
    end
  end
end
