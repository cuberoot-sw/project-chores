class DevelopmentMailInterceptor
	Rails.logger.info "***************INSIDE DEVELOPMENT RAIL INTERCEPTOR"
	def self.delivering_email(message)
		Rails.logger.info "***************INSIDE DEVELOPMENT RAIL INTERCEPTOR*******************"
		message.subject = "[#{message.to}] #{message.subject}"
		message.to = "admen.cuberoot@gmail.com"
	end
end