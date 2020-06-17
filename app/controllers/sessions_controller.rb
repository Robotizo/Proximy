class SessionsController < Clearance::SessionsController



	
	def new
		session[:test] = 'hi'
	end

	def create
		auth = request.env["omniauth.auth"]

		if auth.present?

			user = User.sign_in_from_omniauth(auth) 

			sign_in(user)

			user.login_increment
			if user.sign_in_count == 1
				redirect_to after_signup_path(:interests)
				user.update_attribute(:ip, request.ip)
			else
				redirect_to root_url
				user.update_attribute(:ip, request.ip)
			end

		else

			user = authenticate(params)
			sign_in(user)

			if sign_in(user)
				#if user.email_confirmed == true

					user.login_increment
		
						redirect_to root_url
	
				#else 
					#flash.now[:alert] = 'Confirm your email my dood'
					#render 'new'
				#end


			else

				flash.now[:notice] = 'Email or password is incorrect.'
				render 'new'
			end
		end


			
	


		
			
	
	

	end

	def destroy
  		session[:user_id] = nil
  		session[:omniauth] = nil
  		flash[:alert] = 'You have been logged out'
  		redirect_to root_path
 	end
end

