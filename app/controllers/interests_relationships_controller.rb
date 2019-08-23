class InterestsRelationshipsController < ApplicationController
  def create
  	@interest = Interest.find(params[:followedI_id])
  	current_user.followI(@interest)
  	  respond_to do |format|
    		format.html { redirect_to @interest }
    		format.js
  		end

  end

  def destroy
  	@interest = InterestsRelationship.find(params[:id]).followedI
  	current_user.unfollowI(@interest)
  	  respond_to do |format|
    		format.html { redirect_to @interest }
    		format.js
  		end
  end
end
