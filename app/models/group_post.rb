class GroupPost < ApplicationRecord
	belongs_to :user
	belongs_to :group, touch: true
	has_many :group_comments, dependent: :destroy

	mount_uploader :image, ImageUploader
end
