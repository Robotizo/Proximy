class GroupsRelationship < ApplicationRecord
	belongs_to :followerG, class_name: "User"
  	belongs_to :followedG, class_name: "Group"
  	validates :followerG_id, presence: true
  	validates :followedG_id, presence: true
end
