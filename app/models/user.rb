class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :role
  attr_accessible :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip
  
  # Modals relation
  has_many :projectchores
  accepts_nested_attributes_for :projectchores

  # ROLES = %w[admin moderator author]

  # def role_symbols  
  #   [role.to_sym]
  # end  

  # Set default role to moderator for every signup user
  before_save :default_role_values

  def default_role_values
    self.role = "moderator" if self.role.nil?
  end

end
