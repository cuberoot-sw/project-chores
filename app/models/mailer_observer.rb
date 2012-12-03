class MailerObserver < ActiveRecord::Observer
	Rails.logger.info "***************INSIDE CLASS OBSERVER*********************"
	observe :projectchore, :user

	def after_save(mailer) 
		Rails.logger.info "***************enter AFTER SAVE*********************"
		
		UserMailer.delay.mail_to_admin(mailer)

		Rails.logger.info "***************EXIT AFTER SAVE*********************"
	end
end




