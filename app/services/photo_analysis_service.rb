# app/services/photo_analysis_service.rb

class PhotoAnalysisService
  ANALYSIS_PATH = "/analyze"

  def self.call(photo)
    response = connection.post(ANALYSIS_PATH) do |req|
      req.headers["Content-Type"] = "application/json"
      req.body = { photo_id: photo.id, image_url: photo.image.blob.url }.to_json
    end

    raise "ML service returned #{response.status}: #{response.body}" unless response.success?

    photo.update!(status: "processed")
  end

  def self.connection
    Faraday.new(url: ENV.fetch("ML_SERVICE_URL"))
  end
end
