class ApplicationController < ActionController::Base
  protect_from_forgery


def authenticate_active_admin_user!
    # debugger
    authenticate_user!
    unless current_user.role == "admin"
      # debugger
      flash[:error] = "You Don't have ADMIN Privilege"
      redirect_to root_path
      # redirect_to user_path(@user)
    end
  end

  
  # Authorization using CanCan.
  rescue_from CanCan::AccessDenied do |exception|
  	flash[:error] = "Access denied.-------> Requires Admin Privilege"
  redirect_to root_url
  end

   
end
