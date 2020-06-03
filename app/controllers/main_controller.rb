class MainController < ApplicationController
	def index
		if signed_in?
			@user = current_user


			

			@users = User.all.where.not(avatar: [nil, ""]).where.not(image: [nil, ""]).sort_by {|user| user.userInterests(current_user) + user.ccLocation(current_user.latitude, current_user.longitude)}.reverse 





			@events = Event.where('event_date >= ?', Date.today).sort_by {|event| event.eventsInterest(current_user) }.reverse 
			@groups = Group.all.sort_by {|group| group.groupsInterest(current_user)}.reverse
			@userFriendships = Friendship.where(friend_id: current_user.id, status: "pending")
			@eventNotifs = EventNotif.where(user_id: current_user, is_checked: false)
		end
		@test_user = TestUser.new
		posts = Post.all
		@interests = Interest.all
		group_posts = GroupPost.all
		event_posts = EventPost.all
		all_posts = posts + group_posts + event_posts
		@all_posts = all_posts.sort_by &:updated_at
		# @connections_two = Redis.new.pubsub("channels", "action_cable/*")
		# @connections = ActionCable.server.connections.length
	end

	def faq
		@feedback = Feedback.new
		if signed_in?
			@user = current_user
		end

	end

end
