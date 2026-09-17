# config/initializers/sidekiq.rb

Sidekiq.configure_server do |config|
  config.redis = { url: "redis://redis:6379/0" }

  config.on(:startup) do
    schedule_file = Rails.root.join("config", "schedule.yml")
    Sidekiq::Cron::Job.load_from_hash!(YAML.load_file(schedule_file)) if File.exist?(schedule_file)
  end
end

Sidekiq.configure_client do |config|
  config.redis = { url: "redis://redis:6379/0" }
end
