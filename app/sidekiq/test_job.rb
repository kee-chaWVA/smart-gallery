class TestJob
  include Sidekiq::Job

  def perform(*args)
    puts "Hello from SideKiq"
  end
end
