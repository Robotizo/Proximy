class EventPost < ApplicationRecord
	belongs_to :user
	belongs_to :event, touch: true
	has_many :event_comments, dependent: :destroy

	mount_uploader :image, ImageUploader
end
