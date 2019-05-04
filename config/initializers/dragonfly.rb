require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "bd00442ad7740173b1b65a8713d66ee3022562c789f08805428ab21bb4feb9e2"

  url_format "/media/:job/:name"

  datastore :file,
    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    server_root: Rails.root.join('public')
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
ActiveSupport.on_load(:active_record) do
  extend Dragonfly::Model
  extend Dragonfly::Model::Validations
end
