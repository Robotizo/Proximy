class InterestsRelationshipsToEventsController < ApplicationController
  def create
  	interest = Interest.find(params[:fdE_id])
	$eventTest.fwE(interest)
	respond_to do |format|
		format.html { redirect_to :back }
	   	format.js
	end
  end

  def destroy
  	interest = InterestsRelationshipsToEvent.find(params[:id]).fdE
	$eventTest.ufE(interest)
	respond_to do |format|
	    format.html { redirect_to :back }
	    format.js
	end
  end
end
