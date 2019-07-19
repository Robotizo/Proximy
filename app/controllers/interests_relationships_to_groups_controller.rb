class InterestsRelationshipsToGroupsController < ApplicationController
  	

  	def create
	  	@interest = Interest.find(params[:fdI_id])
	  	$groupTest.fwI(@interest)
	  	  respond_to do |format|
	    		format.html { redirect_to :back }
	    		format.js
	  		end
  	end



  	def destroy
	  	@interest = InterestsRelationshipsToGroup.find(params[:id]).fdI
	  	$groupTest.ufI(@interest)
	  	  respond_to do |format|
	    		format.html { redirect_to :back }
	    		format.js
	  		end
  	end
end
