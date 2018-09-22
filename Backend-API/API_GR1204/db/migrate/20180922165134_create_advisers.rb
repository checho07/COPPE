class CreateAdvisers < ActiveRecord::Migration[5.1]
  def change
    create_table :advisers do |t|
      t.string :name_adviser
      t.string :lastname_adviser
      t.string :cc_adviser
      t.string :email_adviser
      t.float :phone_adviser
      t.integer :age_adviser
      t.integer :experience
      t.references :area, foreign_key: true

      t.timestamps
    end
  end
end
