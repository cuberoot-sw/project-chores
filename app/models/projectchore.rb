class Projectchore < ActiveRecord::Base
  attr_accessible :description, :duedate, :owner, :priority, :status, :user_id
  belongs_to :user
  
  searchable do
    text :description, :boost => 5
  end

   
  # for exporting task data in csv format
  def self.to_csv (options = {})
  	CSV.generate do |csv|
  		csv << column_names
  			all.each do |projectchore|
  				csv << projectchore.attributes.values_at(*column_names)
  			end
  	end
  end
end
