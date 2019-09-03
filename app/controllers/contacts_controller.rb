class ContactsController < ApplicationController
  def index
  	@user = current_user
  	@userFriendships = Friendship.where(friend_id: current_user.id)
    userContacts = @user.following.map(&:id)
    @contacts = User.find(params = userContacts)

  end
end
