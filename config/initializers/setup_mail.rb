Rails.logger.info "***************INSIDE SET UP MAIL METHOD*********************"

# require 'development_mail_interceptor'
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "admen.cuberoot@gmail.com",
  :password             => "admin#cube",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

# Uncomment the below line to activate Interceptors.  
# ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
