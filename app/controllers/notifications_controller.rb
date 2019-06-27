class NotificationsController < ApplicationController
	def index
		@user = current_user

		followingGroupsIds = @user.followingG.map(&:id)
   


		events = Event.where(group_id: followingGroupsIds)
		@eventNotifs = EventNotif.where(user_id: current_user)



		@user_groups = @user.groups.order("created_at DESC")
		followingGroupsIds = @user.followingG.map(&:id)
		@groupsFollow = Group.find(params = followingGroupsIds).sort_by &:updated_at
	end



	def update_notif
	  @eventNotif = EventNotif.find(params[:id])
	  @eventNotif.update_attribute(:is_checked, true)
	  redirect_to @eventNotif.event
	end


end