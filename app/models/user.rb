class User < ApplicationRecord
  include Clearance::User

  validates :name, presence: true
  validates :last_name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validates :password, allow_nil: true, length: { minimum: 6 }, confirmation: true, on: :update
  before_validation { self.email = self.email.downcase }






 
  geocoded_by :ip, :latitude => :latitude, :longitude => :longitude
  after_validation :geocode, if: ->(obj){ !obj.latitude.present? and !obj.longitude.present?}
  

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged





  mount_uploader :avatar, AvatarUploader
  mount_uploader :image, ImageUploader 






  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :group_comments, dependent: :destroy
  has_many :event_comments, dependent: :destroy
  has_many :groups
  has_many :events
  has_many :feedbacks


  

  has_many :eventnotifs



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




  has_many :invitations, class_name: "NotificationEvent", foreign_key: "recipient_id"

  has_many :sent_invites, class_name: "NotificationEvent", foreign_key: "sender_id"


  has_many :friendships
  has_many :friends, through: :friendships


  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_friendships, source: :user






 

  def self.sign_in_from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.email = auth.info.email
      user.provider = auth.provider
      user.name = auth.info.name.gsub(/\s.+/, '')
      user.last_name = auth.info.name.gsub(/.*\s+/, '')
      user.uid = auth.uid
      user.password = SecureRandom.urlsafe_base64.to_s
      user.remote_avatar_url = auth.info.image
      user.sign_in_count = 0
    end
  end








  def test_avatar_exists
    self.includes(:avatar).where.not(user: {avatar: nil})
  end 
  



  def country_name
     c = ISO3166::Country[self.country]
     return c.translations[I18n.locale.to_s] || c.name
  end


    def is_friends?(other_user)
      inverse_friends.include?(other_user)
    end 


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








    R = 6371





    def getDistance(lat, lon)
      if !lat.nil? and !lon.nil? and !self[:latitude].nil? and !self[:longitude].nil?
        dLat = deg2rad(self[:latitude]-lat)
        dLon = deg2rad(self[:longitude]-lon)

        a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(deg2rad(lat)) * Math.cos(deg2rad(self[:latitude])) * Math.sin(dLon/2) * Math.sin(dLon/2)
        c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
        d = R * c

        return d.round(2)
      else 
        return 0
      end
    end




    def deg2rad(deg) 
        return deg * (Math::PI/180)
    end




    def ccLocation(lat, lon)
      d = getDistance(lat, lon)
      @ccL = 0
      if d <= 1
        @ccL = 1
      elsif d > 1 and d <=  2
        @ccL = 0.9
      elsif d > 2 and d <= 5
        @ccL = 0.5
      elsif d > 5 and d <= 10
        @ccL = 0.2
      elsif d > 10 and d <= 20 
        @ccL = 0.05
      else
        @ccL = 0
      end
      return @ccL
    end 




    def updateLat(attribute, by)
      newval = self[attribute] = by
      update_attribute(attribute, newval)
    end


    def updateLon(attribute, by)
      newval = self[attribute] = by
      update_attribute(attribute, newval)
    end











  def userInterests(currentUser)
    if currentUser.followingI.count > 0

      collide = currentUser.followingI.ids & self.followingI.ids
      @ccI = collide.count.to_f / currentUser.followingI.ids.count.to_f
      
      return @ccI.round(2)
    else 
      return 0
    end
  end




  def overallCC
    return @ccL + @ccI.round(2)
  end 






  def login_increment
    increment! :sign_in_count
  end


  def age(dob)
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end




  private

    def slug_candidates
      [:name, [:name, :deduced_id]] # works for main locale but not others
    end

    def deduced_id
      self.class.where(name: name).count + 1
    end



private
  def confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end


  

end











