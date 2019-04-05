class EventsRelationship < ApplicationRecord
	belongs_to :followerE, class_name: "User"
  	belongs_to :followedE, class_name: "Event"
  	validates :followerE_id, presence: true
  	validates :followedE_id, presence: true
end
