ActiveAdmin.register Projectchore do

	index do                            
    column :id                    
    column :description
    column :status
    column :priority         
    column :duedate
    column :created_at
    column :updated_at

    default_actions                   
  end                                 

  # filter :email                       

  form do |f|                         
    f.inputs "Admin Details" do       
      f.input :id                 
      f.input :description              
      f.input :status
      f.input :priority 
      f.input :duedate
      f.input :created_at
      f.input :updated_at
    end                               
    f.buttons                         
  end                                 
  
end


