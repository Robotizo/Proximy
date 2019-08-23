class InterestsRelationshipsToEvent < ApplicationRecord
	belongs_to :frE, class_name: "Event"
  	belongs_to :fdE, class_name: "Interest"
  	validates :frE_id, presence: true
  	validates :fdE_id, presence: true
end
