class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :authorize
  after_action :set_vary_header

  



    def update_friendship
    	@friendship = Friendship.find(params[:id])
    	@friendship.update_attribute(:status, "accepted")
    	Friendship.create!(user_id: current_user.id, friend_id: @friendship.user_id, status: "accepted")
    	redirect_to @friendship.user, notice: 'You are now friends'
  	end



  	def groups

	    @groups = Group.all.sort_by {|group| group.groupsInterest(current_user)}.reverse
	    @user = current_user

	    followingGroupsIds = @user.followingG.map(&:id)
	    @groupsFollow = Group.find(params = followingGroupsIds).sort_by &:updated_at

	    @userFriendships = Friendship.where(friend_id: current_user.id, status: "pending")
	    @eventNotifs = EventNotif.where(user_id: current_user, is_checked: false)


	    respond_to do |format|
	      format.html # show_rec_horses.html.erb
	      format.js   # show_rec_horses.js.erb
	    end

  	end 

  	

  


    private 
	    def current_user 
	     	User.find(session[:user_id])
	    rescue ActiveRecord::RecordNotFound
	     	user = User.create
	      	session[:user_id] = user.id
	      	user
	    end


	    def set_vary_header
		    if request.xhr?
		      response.headers["Vary"] = "accept"
		    end
  		end


    protected
	  	def authorize
	  		unless User.find_by(id: session[:user_id])
	  			redirect_to root_url
	  		end
	  	end
end
