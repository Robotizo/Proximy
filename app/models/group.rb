class Group < ApplicationRecord
	belongs_to :user
	has_many :group_posts, dependent: :destroy
	has_many :events
	mount_uploader :image, ImageUploader
	mount_uploader :cover_image, ImageUploader
	validates_presence_of :title
	validates_presence_of :image
	validates_presence_of :cover_image
	has_many :eventnotifs, through: :events


	has_many :passive_relationships_groups, class_name: "GroupsRelationship", foreign_key: "followedG_id", dependent: :destroy
	has_many :followersG, through: :passive_relationships_groups, source: :followerG

	has_many :active_relationships_interests_to_groups, class_name: "InterestsRelationshipsToGroup", foreign_key: "frI_id", dependent: :destroy
	has_many :fgI, through: :active_relationships_interests_to_groups, source: :fdI

	has_many :groupinvite 


	def fwI(interests)
      fgI << interests
    end

    def ufI(interests)
      fgI.delete(interests)
    end

    def fgI?(interests)
      fgI.include?(interests)
    end




    def groupsInterest(currentUser)
    	if currentUser.followingI.count > 0

		    collideGroups = currentUser.followingI.ids & self.fgI.ids
		    groupsCCI = collideGroups.count.to_f / currentUser.followingI.ids.count.to_f
		    
		    return groupsCCI.round(2)
		else
			return 0
		end 
  	end





end
