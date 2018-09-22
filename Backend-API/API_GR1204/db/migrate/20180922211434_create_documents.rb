class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
      t.string :name_doc
      t.date :creationDate_doc
      t.references :project, foreign_key: true
      t.references :file_type, foreign_key: true

      t.timestamps
    end
  end
end
