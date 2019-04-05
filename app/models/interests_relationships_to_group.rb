class InterestsRelationshipsToGroup < ApplicationRecord
	belongs_to :frI, class_name: "Group"
  	belongs_to :fdI, class_name: "Interest"
  	validates :frI_id, presence: true
  	validates :fdI_id, presence: true
end
