class CreateTutors < ActiveRecord::Migration[5.1]
  def change
    create_table :tutors do |t|
      t.string :name_tutor
      t.string :lastname_tutor
      t.float :cc_tutor
      t.float :phone_tutor
      t.integer :age_tutor
      t.string :email_tutor
      t.integer :experence_tutor
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
