class InterestsRelationshipsToGroupsController < ApplicationController
  	
before_action :assign_group  


  	def create
	  	@interest = Interest.find(params[:fdI_id])
	  	@group.fwI(@interest)
	  	  respond_to do |format|
	    		format.html { redirect_to :back }
	    		format.js
	  		end
  	end



  	def destroy
	  	@interest = InterestsRelationshipsToGroup.find(params[:id]).fdI
	  	@group.ufI(@interest)
	  	  respond_to do |format|
	    		format.html { redirect_to :back }
	    		format.js
	  		end
  	end

  	private
  	
		def assign_group
		  @group = Group.find(params[:frI_id])
		end


end
