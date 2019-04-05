class MainController < ApplicationController
	skip_before_action :authorize
	  def index
	  	@users = User.all
	  	@user = current_user
	  	posts = Post.all
	  	group_posts = GroupPost.all
	  	event_posts = EventPost.all
	  	all_posts = posts + group_posts + event_posts
	  	@all_posts = all_posts.sort_by &:updated_at
	  end
end
