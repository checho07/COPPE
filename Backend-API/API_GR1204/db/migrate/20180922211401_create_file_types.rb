class CreateFileTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :file_types do |t|
      t.string :fileType

      t.timestamps
    end
  end
end
