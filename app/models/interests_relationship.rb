class InterestsRelationship < ApplicationRecord
	belongs_to :followerI, class_name: "User"
  	belongs_to :followedI, class_name: "Interest"
  	validates :followerI_id, presence: true
  	validates :followedI_id, presence: true




end
