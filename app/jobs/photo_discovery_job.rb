class PhotoDiscoveryJob
  include Sidekiq::Job

  def perform
    PhotoDiscoveryService.call
  end
end
