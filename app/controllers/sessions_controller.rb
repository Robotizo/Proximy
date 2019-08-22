class SessionsController < ApplicationController
	skip_before_action :authorize


	
	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
 
		if user && user.authenticate(params[:session][:password])
			if user.email_confirmed == true
			    session[:user_id] = user.id
				user.login_increment
				if user.sign_in_count == 1
					redirect_to interests_user_path(user)
				else 
					redirect_to root_url
				end
			else 
				flash.now[:alert] = 'Confirm your email my dood'
				render 'new'
			end


		else
			flash.now[:alert] = 'Invalid email/password combination'
			render 'new'
		end
	end

	def destroy
  		session[:user_id] = nil
  		flash[:alert] = 'You have been logged out'
  		redirect_to root_path
 	end
end

