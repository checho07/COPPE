class CreateEntityTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :entity_types do |t|
      t.string :type_entity

      t.timestamps
    end
  end
end
