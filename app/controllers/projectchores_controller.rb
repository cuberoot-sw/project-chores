class ProjectchoresController < ApplicationController

  #the user should be logged in to perform any operation
  before_filter :authenticate_user!, :except => [:show, :index]


  # Added for CanCan Authorization
  load_and_authorize_resource

  rescue_from CanCan::AccessDenied do |exception|
  flash[:error] = "Access denied."
  redirect_to root_url
  end

  def index
  # debugger
   	@projectchores = Projectchore.all
            
    respond_to do |format|
      format.html 
      format.json { render json: @projectchores }
    end
  end



  def new
   	@projectchore = Projectchore.new
   	
    respond_to do |format|
   		format.html
   		format.json {render json: @projectchore }
      end
  end



  def create
   	@projectchore = Projectchore.new(params[:projectchore])
    # debugger
    
    respond_to do |format|
      if @projectchore.save
        UserMailer.registration_confirmation(@projectchore).deliver
        format.html { redirect_to @projectchore, notice: 'Task was successfully created.' }
        format.json { render json: @projectchore, status: :created, location: @projectchore }
      else
        format.html { render action: "new" }
        format.json { render json: @projectchore.errors, status: :unprocessable_entity }
      end
    end
    end




    def show
    	@projectchore = Projectchore.find(params[:id])

    	respond_to do |format|
   		format.html
   		format.json {render json: @projectchore }
    end



    def edit
   		@projectchore = Projectchore.find(params[:id])
    end




    def update
   		@projectchore = Projectchore.find(params[:id])
      	respond_to do |format|
      		if @projectchore.update_attributes(params[:projectchore])
            UserMailer.registration_confirmation(@projectchore).deliver
        		format.html { redirect_to @projectchore, notice: 'Project Task was successfully updated.' }
        		format.json { head :no_content }
      		else
        		format.html { render action: "edit" }
        		format.json { render json: @projectchore.errors, status: :unprocessable_entity }
      		end
      	end
      end
    end



  def destroy
    @projectchore = Projectchore.find(params[:id])
    @projectchore.destroy

    respond_to do |format|
      format.html { redirect_to projectchores_url }
      format.json { head :no_content }
    end
  end
end
