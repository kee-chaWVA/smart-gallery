class AddConstraintsToPhotos < ActiveRecord::Migration[8.1]
  def change
    change_column_null :photos, :filename, false
    change_column_null :photos, :file_path, false
    change_column_null :photos, :status, false
  end
end
