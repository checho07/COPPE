class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name_cour
      t.float :duration_cour
      t.date :date_cour
      t.string :link_cour
      t.string :teacher_cour
      t.references :course_type, foreign_key: true
      t.references :area, foreign_key: true

      t.timestamps
    end
  end
end
