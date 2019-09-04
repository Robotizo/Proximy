class UserMailer < ApplicationMailer
	default from: "Proximy <info@proximy.ca>"

	def registration_confirmation(user)
		@user = user
		mail(to: @user.email, subject: "Registration Confirmation")
	end

end
