class Friendship < ApplicationRecord

	belongs_to :user
	belongs_to :friend, class_name: "User"

	validate :not_friends
	validate :not_self

	after_initialize :pending


	def pending
      self.status ||= "pending"        
    end



	def update_notif
	  @eventNotif = EventNotif.find(params[:id])
	  @eventNotif.update_attribute(:is_checked, true)
	  redirect_to @eventNotif.event
	end



	def not_friends
    	errors.add(:friend, 'is already added') if user.friends.include?(friend)
 	end

 	def not_self
  		errors.add(:friend, "can't be equal to user") if user == friend
	end




end
