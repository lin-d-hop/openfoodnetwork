Openfoodnetwork::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # Code is not reloaded between requests
  config.cache_classes = true

  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Disable Rails's static asset server (Apache or nginx will already do this)
  config.serve_static_assets = false

  # Compress JavaScripts and CSS
  config.assets.compress = true

  # Don't fallback to assets pipeline if a precompiled asset is missed
  config.assets.compile = false

  # Generate digests for assets URLs
  config.assets.digest = true

  # Defaults to Rails.root.join("public/assets")
  # config.assets.manifest = YOUR_PATH

  # Specifies the header that your server uses for sending files
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  config.force_ssl = true

  # Use https in email links
  config.action_mailer.default_url_options = { protocol: 'https' }

  # Note: This config no longer works with our new logging strategy
  # config.log_level = :debug

  # Configure logging for Rails 3.2:
  config.logger = ActiveSupport::TaggedLogging.new(Logger.new(Rails.root.join("log", "#{Rails.env}.log")))
  config.logger.level = Logger::INFO
  config.logger.formatter = Logger::Formatter.new
  config.logger.datetime_format = "%Y-%m-%d %H:%M:%S"
  # Once we get to Rails 4.0, we can replace the above with:
  #config.log_formatter = Logger::Formatter.new.tap { |f| f.datetime_format = "%Y-%m-%d %H:%M:%S" }

  # Use a different cache store in production
  memcached_value_max_megabytes = ENV.fetch("MEMCACHED_VALUE_MAX_MEGABYTES", 1).to_i
  memcached_value_max_bytes = memcached_value_max_megabytes * 1024 * 1024
  config.cache_store = :dalli_store, { value_max_bytes: memcached_value_max_bytes }

  # Enable serving of images, stylesheets, and JavaScripts from an asset server
  # config.action_controller.asset_host = "http://assets.example.com"

  # Precompile additional assets (application.js, application.css, and all non-JS/CSS are already added)
  # config.assets.precompile += %w( search.js )

  require 'uglifier'
  config.assets.js_compressor = Uglifier.new(mangle: false)

  # Disable delivery errors, bad email addresses will be ignored
  # config.action_mailer.raise_delivery_errors = false

  # Enable threaded mode
  # config.threadsafe!

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found)
  config.i18n.fallbacks = [:en]

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify

  # force ssl site-wide
  # config.middleware.insert_before ActionDispatch::Static, "Rack::SSL"
end
