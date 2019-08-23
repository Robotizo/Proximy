class GroupsRelationshipsController < ApplicationController
  def create
	group = Group.find(params[:followedG_id])
	current_user.followG(group)
  	respond_to do |format|
    		format.html { redirect_to group }
    		format.js
  	end
  end

  def destroy
  	group = GroupsRelationship.find(params[:id]).followedG
    current_user.unfollowG(group)
    	respond_to do |format|
      		format.html { redirect_to group }
      		format.js
    	end
  end
end
