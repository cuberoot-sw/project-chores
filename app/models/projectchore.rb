class Projectchore < ActiveRecord::Base
  attr_accessible :description, :duedate, :owner, :priority, :status, :user_id
  belongs_to :user
end
