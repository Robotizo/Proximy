class Group < ApplicationRecord
	belongs_to :user
	has_many :group_posts, dependent: :destroy
	has_many :events
	mount_uploader :image, ImageUploader
	mount_uploader :cover_image, ImageUploader

	has_many :passive_relationships_groups, class_name: "GroupsRelationship", foreign_key: "followedG_id", dependent: :destroy
	has_many :followersG, through: :passive_relationships_groups, source: :followerG

	has_many :active_relationships_interests_to_groups, class_name: "InterestsRelationshipsToGroup", foreign_key: "frI_id", dependent: :destroy
	has_many :fgI, through: :active_relationships_interests_to_groups, source: :fdI


	def fwI(interests)
      fgI << interests
    end

    def ufI(interests)
      fgI.delete(interests)
    end

    def fgI?(interests)
      fgI.include?(interests)
    end

end
