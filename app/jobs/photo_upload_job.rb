class PhotoUploadJob
  include Sidekiq::Job

  def perform(photo_id)
    PhotoUploadService.call(Photo.find(photo_id))
  rescue ActiveRecord::RecordNotFound
    # Photo was deleted before this job (or a retry) ran — nothing to upload.
  end
end
