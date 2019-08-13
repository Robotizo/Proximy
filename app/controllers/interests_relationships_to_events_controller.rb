class InterestsRelationshipsToEventsController < ApplicationController

	before_action :assign_event




  def create
  	@interest = Interest.find(params[:fdE_id])
	@event.fwE(@interest)
	respond_to do |format|
		format.html { redirect_to :back }
	   	format.js
	end
  end

  def destroy
  	@interest = InterestsRelationshipsToEvent.find(params[:id]).fdE
	@event.ufE(@interest)
	respond_to do |format|
	    format.html { redirect_to :back }
	    format.js
	end
  end



	private
	
	def assign_event
	  @event = Event.find(params[:frE_id])
	end

end
