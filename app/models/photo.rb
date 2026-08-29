class Photo < ApplicationRecord
  validates :filename, presence: true
  validates :filepath, presence: true, uniqueness: true
end
