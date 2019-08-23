class EventPost < ApplicationRecord
	belongs_to :user
	belongs_to :event, touch: true

	mount_uploader :image, ImageUploader
end
