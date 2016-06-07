Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://127.0.0.1:6379/12' }
  config.server_middleware do |chain|
    chain.add Sidekiq::Middleware::Server::RetryJobs, max_retries: 1
  end
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://127.0.0.1:6379/12' }
end
