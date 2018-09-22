class CreateAdvisories < ActiveRecord::Migration[5.1]
  def change
    create_table :advisories do |t|
      t.string :type_advisory
      t.references :adviser, foreign_key: true
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
