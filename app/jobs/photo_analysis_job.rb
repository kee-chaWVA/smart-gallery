class PhotoAnalysisJob
  include Sidekiq::Job

  def perform(photo_id)
    PhotoAnalysisService.call(Photo.find(photo_id))
  rescue ActiveRecord::RecordNotFound
    # Photo was deleted before this job (or a retry) ran — nothing to analyze.
  end
end
