class StatsMailer < ApplicationMailer
	default from: "Proximy <info@proximy.ca>"

	def new_user_status(user)
		@user = user
		mail(to: '16caizab@gmail.com', subject: 'New User Congrats')
	end

end
