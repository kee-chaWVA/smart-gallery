# app/services/photo_discovery_service.rb

class PhotoDiscoveryService
  IMPORTS_DIR = Rails.root.parent.join("imports", "incoming").freeze
  EXTENSIONS = %w[jpg jpeg png JPG JPEG PNG].freeze

  def self.call
    Dir.glob(IMPORTS_DIR.join("*.{#{EXTENSIONS.join(',')}}")).each do |file_path|
      filename = File.basename(file_path)

      photo = Photo.find_or_initialize_by(file_path: file_path)
      next unless photo.new_record?

      photo.filename = filename
      photo.status = "pending"
      photo.save!

      PhotoUploadJob.perform_async(photo.id)
    end
  end
end
