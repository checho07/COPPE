class CreateEntrepCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :entrep_courses do |t|
      t.references :course, foreign_key: true
      t.references :entrepreneur, foreign_key: true

      t.timestamps
    end
  end
end
