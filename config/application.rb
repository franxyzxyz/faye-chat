require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

require './app/middleware/chat_backend'

module FayechatRails
  class Application < Rails::Application

    config.middleware.use ChatDemo::ChatBackend

    config.active_record.raise_in_transactional_callbacks = true

  end
end
