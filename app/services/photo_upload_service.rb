# app/services/photo_upload_service.rb

class PhotoUploadService
  def self.call(photo)
    return if photo.image.attached?

    File.open(photo.file_path) do |file|
      photo.image.attach(io: file, filename: photo.filename)
    end

    photo.update!(status: "uploaded")
  end
end
