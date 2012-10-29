class UserMailer < ActionMailer::Base

  default :from => "arvind.kishore@gmail.com"

	def registration_confirmation(projectchore)
		
		mail(:to => projectchore.user.email, :subject => projectchore.description, :content_type => "text/html")
	end

	def mail_to_admin(projectchore)

		# debugger
		# unless projectchore.user.role == "moderator"
			mail(:to => projectchore.user.email, :subject => projectchore.description, :content_type => "text/html")
		# end
	end

end
