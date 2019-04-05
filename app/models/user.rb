class User < ApplicationRecord
	validates :name, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
	validates :password, presence: true, length: { minimum: 6 }, on: :create
	validates :password, allow_nil: true, length: { minimum: 6 }, confirmation: true, on: :update

	has_secure_password
	mount_uploader :avatar, AvatarUploader
  mount_uploader :image, ImageUploader


	has_many :posts, dependent: :destroy
	has_many :groups
	has_many :events
  has_many :group_posts, dependent: :destroy
  has_many :event_posts, dependent: :destroy


  has_many :interests, dependent: :destroy


	has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
	has_many :following, through: :active_relationships, source: :followed

	has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
	has_many :followers, through: :passive_relationships, source: :follower



	has_many :active_relationships_groups, class_name: "GroupsRelationship", foreign_key: "followerG_id", dependent: :destroy
	has_many :followingG, through: :active_relationships_groups, source: :followedG


	has_many :active_relationships_events, class_name: "EventsRelationship", foreign_key: "followerE_id", dependent: :destroy
	has_many :followingE, through: :active_relationships_events, source: :followedE


  has_many :active_relationships_interests, class_name: "InterestsRelationship", foreign_key: "followerI_id", dependent: :destroy
  has_many :followingI, through: :active_relationships_interests, source: :followedI






	  def follow(other_user)
    	following << other_user
  	end

  	def unfollow(other_user)
    	following.delete(other_user)
  	end

  	def following?(other_user)
    	following.include?(other_user)
  	end


  	def followG(group)
    	followingG << group
  	end

  	def unfollowG(group)
    	followingG.delete(group)
  	end

  	def followingG?(group)
    	followingG.include?(group)
  	end



  	def followE(event)
    	followingE << event
  	end

  	def unfollowE(event)
    	followingE.delete(event)
  	end

  	def followingE?(event)
    	followingE.include?(event)
  	end



    def followI(interests)
      followingI << interests
    end

    def unfollowI(interests)
      followingI.delete(interests)
    end

    def followingI?(interests)
      followingI.include?(interests)
    end

end











