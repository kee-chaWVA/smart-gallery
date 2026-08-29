class CreatePhotos < ActiveRecord::Migration[8.1]
  def change
    create_table :photos do |t|
      t.string :filename
      t.string :file_path
      t.string :status

      t.timestamps
    end
  end
end
