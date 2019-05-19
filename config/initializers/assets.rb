
# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path
Rails.application.config.assets.precompile += %w( users.js )
Rails.application.config.assets.precompile += %w( groups.js )
Rails.application.config.assets.precompile += %w( events.js )
Rails.application.config.assets.precompile += %w( notifications.js )

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( main.css )
Rails.application.config.assets.precompile += %w( users.css )
Rails.application.config.assets.precompile += %w( groups.css )
Rails.application.config.assets.precompile += %w( events.css )
Rails.application.config.assets.precompile += %w( sessions.css )
Rails.application.config.assets.precompile += %w( posts.css )
Rails.application.config.assets.precompile += %w( conversations.css )
Rails.application.config.assets.precompile += %w( notifications.css )
Rails.application.config.assets.precompile += %w( interests.css )