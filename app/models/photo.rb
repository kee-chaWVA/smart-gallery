class Photo < ApplicationRecord
  validates :filename, presence: true
  validates :file_path, presence: true, uniqueness: true
end
