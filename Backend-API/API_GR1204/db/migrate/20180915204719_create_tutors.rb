class CreateTutors < ActiveRecord::Migration[5.1]
  def change
    create_table :tutors do |t|
      t.string :name_tutor
      t.string :
      t.string :lastname_tutor
      t.string :
      t.string :cc_tutor
      t.float :
      t.string :phone_tutor
      t.float :
      t.string :age_tutor
      t.int :
      t.string :email_tutor
      t.string :
      t.string :experence_tutor
      t.int :
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
