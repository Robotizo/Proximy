class SessionsController < Clearance::SessionsController



	
	def new
	end

	def create
		@user = authenticate(params)
 
		if sign_in(@user)
			#if user.email_confirmed == true

				@user.login_increment
				if @user.sign_in_count == 1
					redirect_to interests_user_path(@user)
				else 
					redirect_to root_url
				end
			#else 
				#flash.now[:alert] = 'Confirm your email my dood'
				#render 'new'
			#end


		else

			flash.now[:notice] = 'Email or password is incorrect.'
			render 'new'
		end
	end

	def destroy
  		session[:user_id] = nil
  		flash[:alert] = 'You have been logged out'
  		redirect_to root_path
 	end
end

