class UserMailer < ActionMailer::Base

	Rails.logger.info "***************INSIDE CLASS USERMAILER**************"

  	default :from => "admen.cuberoot@gmail.com"

	def registration_confirmation(projectchore)
		Rails.logger.info "***************START REGISTRATION CONFIRMATION**************"
		@projectchore = projectchore
		mail(:to => projectchore.user.email, :subject => projectchore.description, :content_type => "text/html")
	end


# Function for sending mail to update the owner
	def send_mail(projectchore)
		Rails.logger.info "***************START SEND MAIL**************"
		@projectchore = projectchore
		mail(:to => projectchore.user.email, :subject => projectchore.description, :content_type => "text/html")
	end


# Observer function to send mail to admin whenever any database update take place
	def mail_to_admin(projectchore)
		Rails.logger.info "***************START MAIL TO ADMIN**************"
		@projectchore = projectchore
		mail(:to => "admen.cuberoot@gmail.com", :subject => projectchore.description)
	end

end
