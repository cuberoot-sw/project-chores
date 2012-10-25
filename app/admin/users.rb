ActiveAdmin.register User do
	
  index do                            
    column :id                    
    column :email
    # column :priority         
    column :name
    column :role            
    default_actions                   
  end                                 

  # filter :email                       

  form do |f|                         
    f.inputs "Admin Details" do       
      f.input :id                 
      f.input :email             
      # f.input :priority 
      f.input :name
      f.input :role
    end                               
    f.buttons                         
  end 





  #  form do |f|
  #   f.inputs "User Details" do
  #     f.input :name
  #     f.input :email
  #     f.input :role, :label => "Administrator"
  #   end
  #   f.buttons
  # end


#   ActiveAdmin::Users.build do
#   section "User Profile" do
#     table_for User.order("created_at desc") do
#       column :id
#       column :email
#       column :name
#       column :role
#     end
#     # strong { link_to "View All Users", admin_users_path }
# end
# end

  create_or_edit = Proc.new {
      @user            = User.find_or_create_by_id(params[:id])
# debugger
    @user.role = params[:user][:role]
# debugger
    @user.attributes = params[:user].delete_if do |k, v|
      (k == "role") ||
      (["password", "password_confirmation"].include?(k) && v.empty? && !@user.new_record?)
    end
    if @user.save
      redirect_to :action => :show, :id => @user.id
    else
      render active_admin_template((@user.new_record? ? 'new' : 'edit') + '.html.erb')
    end
  }
  member_action :create, :method => :post, &create_or_edit
  member_action :update, :method => :put, &create_or_edit

end


  