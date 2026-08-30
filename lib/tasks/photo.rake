namespace :photos do
  desc "Discover new photos"
  task discover: :environment do
    count = PhotoDiscoveryService.call
    puts "Discovery complete. Imported #{count} photos."
  end
end
