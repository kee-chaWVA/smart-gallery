class AddUniqueIndexToPhotosFilePath < ActiveRecord::Migration[8.1]
  def change
    add_index :photos, :file_path, unique: true
  end
end
