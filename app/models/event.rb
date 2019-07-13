class Event < ApplicationRecord
	belongs_to :user
	belongs_to :group, optional: true
	mount_uploader :image, ImageUploader
	validates_presence_of :event_time
	validates_presence_of :event_date
	validates :event_end_date, presence: false
	validates :event_end_time, presence: false

	has_many :event_posts, dependent: :destroy

	has_many :passive_relationships_events, class_name: "EventsRelationship", foreign_key: "followedE_id", dependent: :destroy
	has_many :followersE, through: :passive_relationships_events, source: :followerE



	has_many :active_relationships_interests_to_events, class_name: "InterestsRelationshipsToEvent", foreign_key: "frE_id", dependent: :destroy
	has_many :fgE, through: :active_relationships_interests_to_events, source: :fdE


	has_many :notificationevents 

	geocoded_by :address
	after_validation :geocode





	has_many :eventnotifs



	def fwE(interests)
      fgE << interests
    end

    def ufE(interests)
      fgE.delete(interests)
    end

    def fgE?(interests)
      fgE.include?(interests)
    end



    def eventsInterest(currentUser)

	    collideEvents = currentUser.followingI.ids & self.fgE.ids
	    eventsCCI = collideEvents.count.to_f / currentUser.followingI.ids.count.to_f
	    
	    return eventsCCI.round(2)
  	end

end





















