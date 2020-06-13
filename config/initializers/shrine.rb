# config/initializers/shrine.rb

require "shrine" # core
require "shrine/storage/file_system" # plugin to save files using file system
require "shrine/storage/s3"



if Rails.env.development?
	Shrine.storages = {
	    cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"), 
	    store: Shrine::Storage::FileSystem.new("public", prefix: "uploads/store"),
	}
elsif Rails.env.production?

	s3_options = {
    access_key_id:     ENV['S3_ACCESS_KEY'],
    secret_access_key: ENV['S3_SECRET_KEY'],
    region:            ENV['S3_REGION'],
    bucket:            ENV['S3_BUCKET']
  }

  Shrine.storages = {
    cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
    store: Shrine::Storage::S3.new(prefix: "store", **s3_options)
  }
	
end


# if Rails.env.production?
# 	CarrierWave.configure do |config|
# 		config.fog_credentials = {
# 			provider: 'AWS', 
# 			aws_access_key_id: ENV['S3_ACCESS_KEY'],
# 			aws_secret_access_key: ENV['S3_SECRET_KEY']
# 		}
# 		config.fog_directory = ENV['S3_BUCKET']
# 	end
# end

Shrine.plugin :activerecord # enable ActiveRecord support
Shrine.plugin :determine_mime_type # check MIME TYPE

# Shrine.plugin :validation_helpers, default_messages: {
#     mime_type_inclusion: ->(whitelist) { # you may use whitelist variable to display allowed types
#       "isn't of allowed type. It must be an image."
#     }
# }
# 
# Shrine::Attacher.validate do
#   validate_mime_type_inclusion [ # whitelist only these MIME types
#                                    'image/jpeg',
#                                    'image/png',
#                                    'image/gif'
#                                ]
#   validate_max_size 1.megabyte # limit file size to 1MB
# end



























