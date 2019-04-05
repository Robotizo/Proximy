class Interest < ApplicationRecord
	belongs_to :user
	mount_uploader :image, ImageUploader


	has_many :passive_relationships_interests, class_name: "InterestsRelationship", foreign_key: "followedI_id", dependent: :destroy
	has_many :followersI, through: :passive_relationships_interests, source: :followerI

	has_many :passive_relationships_interests_to_groups, class_name: "InterestsRelationshipsToGroup", foreign_key: "fdI_id", dependent: :destroy
	has_many :fsI, through: :passive_relationships_interests_to_groups, source: :frI


	has_many :passive_relationships_interests_to_events, class_name: "InterestsRelationshipsToEvent", foreign_key: "fdE_id", dependent: :destroy
	has_many :fsE, through: :passive_relationships_interests_to_events, source: :frE




end
