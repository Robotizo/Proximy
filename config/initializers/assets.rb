
# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path
Rails.application.config.assets.precompile += %w( users.js )
Rails.application.config.assets.precompile += %w( groups.js )
Rails.application.config.assets.precompile += %w( events.js )
Rails.application.config.assets.precompile += %w( notifications.js )
Rails.application.config.assets.precompile += %w( jquery.pagepiling.js )
Rails.application.config.assets.precompile += %w( jquery.pagepiling.min.js )
Rails.application.config.assets.precompile += %w( datepicker.js )
Rails.application.config.assets.precompile += %w( jquery.lazyload.js )
Rails.application.config.assets.precompile += %w( jquery.lazy.js )
Rails.application.config.assets.precompile += %w( lazy-load-images.min.js )
Rails.application.config.assets.precompile += %w( jquery.waitforimages.js )


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
Rails.application.config.assets.precompile += %w( contacts.css )
Rails.application.config.assets.precompile += %w( feedbacks.css ) 
Rails.application.config.assets.precompile += %w( jquery.pagepiling.css )
Rails.application.config.assets.precompile += %w( datepicker.css )
Rails.application.config.assets.precompile += %w( chats.css )
Rails.application.config.assets.precompile += %w( lazy-load-images.min.css )
Rails.application.config.assets.precompile += %w( animate.css )