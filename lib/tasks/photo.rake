namespace :photos do
  desc "Discover new photos"
  task discover: :environment do
    count = PhotoDiscoveryService.call
    puts "Discovery complete. Imported #{count} photos."
  end

  desc "Send uploaded photos to the ML service for analysis"
  task analyze: :environment do
    photos = Photo.where(status: "uploaded")
    photos.find_each { |photo| PhotoAnalysisJob.perform_async(photo.id) }
    puts "Queued #{photos.count} photos for analysis."
  end
end
