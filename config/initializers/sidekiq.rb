# frozen_string_literal: true

module Sidekiq
  class Logger < ::Logger
    module Formatters
      class ExtraPretty < Base
        def call(severity, time, program_name, message)
          "#{time.localtime.iso8601(3)} #{super}"
        end
      end
    end
  end
end

Sidekiq.configure_server do |config|
  config.redis = { url: "redis://" + ENV.fetch("REDIS_HOST", "redis") + ":" + ENV.fetch("REDIS_PORT", "6379")}
  config.log_formatter = Sidekiq::Logger::Formatters::ExtraPretty.new
end

Sidekiq.configure_client do |config|
  config.redis = { url: "redis://" + ENV.fetch("REDIS_HOST", "redis") + ":" + ENV.fetch("REDIS_PORT", "6379")}
  config.log_formatter = Sidekiq::Logger::Formatters::ExtraPretty.new
end
