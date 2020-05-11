class AfterSignupController < ApplicationController
	include Wicked::Wizard

	steps :interests, :personal, :location


	def show
		if signed_in?
		    @user = current_user
		    case step
		    when :interests
	    	    @arts = Interest.where(category: "Arts")
			    @animals = Interest.where(category: "Animals")
			    @business = Interest.where(category: "Business")
			    @community = Interest.where(category: "Community")
			    @crafts = Interest.where(category: "Crafts")
			    @dance = Interest.where(category: "Dance")
			    @eating = Interest.where(category: "Eating & Drinking")
			    @education = Interest.where(category: "Education")
			    @entertainment = Interest.where(category: "Entertainment")
			    @fashion = Interest.where(category: "Fashion")
			    @fitness = Interest.where(category: "Fitness")
			    @games = Interest.where(category: "Games")
			    @health = Interest.where(category: "Health & Wellness")
			    @culture = Interest.where(category: "Culture")
			    @LGBTQA = Interest.where(category: "LGBTQA")
			    @auto = Interest.where(category: "Motor Sports")
			    @perspective = Interest.where(category: "Perspective")
			    @outdoors = Interest.where(category: "Outdoor")
			    @relationships = Interest.where(category: "Relationships")
			    @sports = Interest.where(category: "Sports")
			    @tech = Interest.where(category: "Tech")
			when :personal
			 
			when :location
				@user = current_user
			end
		    render_wizard
		end
  	end


  	def update 
  		if signed_in?
  			@user = current_user
  			@user.update(user_params)
  			render_wizard @user
  		end 
  	end


	private

	def user_params
      params.require(:user).permit(:name, :last_name, :email, :image, :avatar, :bio, :password, :password_confirmation, :latitude, :longitude, :distance_is_checked, :ip, :country, :provider, :uid)
    end



end
