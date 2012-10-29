class Projectchore < ActiveRecord::Base
  attr_accessible :description, :duedate, :owner, :priority, :status, :user_id
  belongs_to :user
  # after_update :mail_to_admin, :if => :status_changed?
   
  # for exporting task data in csv format
  def self.to_csv (options = {})
  	CSV.generate do |csv|
  		csv << column_names
  			all.each do |projectchore|
  				csv << projectchore.attributes.values_at(*column_names)
  			end
  	end
  end

  # def mail_to_admin(projectchore)
      
  #     if(projectchore.user.role == "admin")
  #       mail(:to => projectchore.user.email, :subject => "Project task updated", :content_type => "text/html")
  #     end
  # end

end
