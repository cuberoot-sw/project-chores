class UserMailer < ActionMailer::Base

  default :from => "arvind.kishore@gmail.com"

	def registration_confirmation(projectchore)
		# @user = user
		# mail(:to => user.email, :subject => "Registered", :content_type => "text/html")		
		mail(:to => projectchore.user.email, :subject => projectchore.description, :content_type => "text/html")
		
	end

end
