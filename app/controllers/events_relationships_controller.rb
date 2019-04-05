class EventsRelationshipsController < ApplicationController
  def create
  	event = Event.find(params[:followedE_id])
	current_user.followE(event)
	respond_to do |format|
  		format.html { redirect_to event }
  		format.js
	end
  end

  def destroy
  	event = EventsRelationship.find(params[:id]).followedE
    current_user.unfollowE(event)
	respond_to do |format|
  		format.html { redirect_to event }
  		format.js
	end
  end
end
