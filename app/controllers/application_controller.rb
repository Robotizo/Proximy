class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :authorize



    def update_friendship
    	@friendship = Friendship.find(params[:id])
    	@friendship.update_attribute(:status, "accepted")
    	Friendship.create!(user_id: current_user.id, friend_id: @friendship.user_id, status: "accepted")
    	redirect_to @friendship.user
  	end

  


    private 
	    def current_user 
	     	User.find(session[:user_id])
	    rescue ActiveRecord::RecordNotFound
	     	user = User.create
	      	session[:user_id] = user.id
	      	user
	    end


    protected
	  	def authorize
	  		unless User.find_by(id: session[:user_id])
	  			redirect_to root_url, notice: "Please log in"
	  		end
	  	end
end
