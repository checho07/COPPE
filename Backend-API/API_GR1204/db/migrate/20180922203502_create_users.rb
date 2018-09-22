class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :name_user
      t.string :lastname_user
      t.float :cc_user
      t.integer :phone_user
      t.integer :age_user
      t.string :email_user
      t.integer :experience_user
      t.references :role, foreign_key: true

      t.timestamps
    end
  end
end
