# app/services/photo_discovery_service.rb

class PhotoDiscoveryService
  IMPORTS_DIR = Rails.root.parent.join("imports", "incoming").freeze
  EXTENSIONS = %w[jpg jpeg png JPG JPEG PNG].freeze

  def self.call
    Dir.glob(IMPORTS_DIR.join("*.{#{EXTENSIONS.join(',')}}")).each do |file_path|
      filename = File.basename(file_path)

      Photo.find_or_create_by!(file_path: file_path) do |photo|
        photo.filename = filename
        photo.status = "pending"
      end
    end
  end
end
