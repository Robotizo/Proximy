class MainController < ApplicationController
	skip_before_action :authorize
	  def index
	  	if session[:user_id] 
	  		@user = current_user
	  		@users = User.all.sort_by {|user| user.userInterests(current_user) + user.ccLocation(current_user.latitude, current_user.longitude) }.reverse
	  	end
	  	posts = Post.all
	  	group_posts = GroupPost.all
	  	event_posts = EventPost.all
	  	all_posts = posts + group_posts + event_posts
	  	@all_posts = all_posts.sort_by &:updated_at



	  	@test = params[:lat]

	  end

	  def discover

	  end
end
