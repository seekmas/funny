# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.precompile += %w( admin.css )
Rails.application.config.assets.precompile += %w( admin.js )

Rails.application.config.assets.precompile += %w( default.css )
Rails.application.config.assets.precompile += %w( default.js )

Rails.application.config.assets.precompile += %w( work.css )
Rails.application.config.assets.precompile += %w( work.js )

Rails.application.config.assets.precompile += %w( cheerup.css )
Rails.application.config.assets.precompile += %w( cheerup.js )

Rails.application.config.assets.precompile += %w( lottery.css )
Rails.application.config.assets.precompile += %w( lottery.js )

Rails.application.config.assets.precompile += %w( clean.css )
Rails.application.config.assets.precompile += %w( clean.js )
