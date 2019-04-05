class GroupPost < ApplicationRecord
	belongs_to :user
	belongs_to :group, touch: true

	mount_uploader :image, ImageUploader
end
