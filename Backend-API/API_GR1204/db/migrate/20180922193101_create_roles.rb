class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.string :name_role
      t.string :desc_role

      t.timestamps
    end
  end
end
