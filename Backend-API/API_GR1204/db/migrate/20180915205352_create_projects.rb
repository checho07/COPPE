class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name_project
      t.int :%progress_project
      t.int :numMembers__project
      t.date :creationDate_project
      t.date :finalDate_project
      t.references :entrepreneur, foreign_key: true
      t.references :tutor, foreign_key: true
      t.references :area, foreign_key: true

      t.timestamps
    end
  end
end
