class ContactsController < ApplicationController
  def index
  	@user = current_user
    userContacts = @user.following.map(&:id)
    @contacts = User.find(params = userContacts)
    @userFriendships = Friendship.where(friend_id: current_user.id, status: "pending")
    @eventNotifs = EventNotif.where(user_id: current_user, is_checked: false)

  end
end
