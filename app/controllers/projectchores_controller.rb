class ProjectchoresController < ApplicationController

  #the user should be logged in to perform any operation
  before_filter :authenticate_user!, :except => [:show, :index]
  
  # Added for CanCan Authorization
  load_and_authorize_resource

    def index
  # debugger
     	@projectchores = Projectchore.all
      myindexrender @projectchores 

    # for Pagination
      @projectchores = Projectchore.page(params[:page]).per(4)
       myindexrender @projectchores


    # for exporting data to/in .csv format
      respond_to do |format|
      format.html
      format.csv {send_data @projectchores.to_csv }
      # format.xls {send_data @projectchores.to_csv(col_sep: "\t")}
      format.xls
      end       
    end

  # method for rendering Index action
    def myindexrender mytasks
      respond_to do |format|
      format.html 
      format.json { render json: @mytasks }
      return true
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
    end



    def edit
   		@projectchore = Projectchore.find(params[:id])
    end




    def update
   		@projectchore = Projectchore.find(params[:id])
      	respond_to do |format|
      		if @projectchore.update_attributes(params[:projectchore])
            UserMailer.registration_confirmation(@projectchore).deliver
            # debugger
            # UserMailer.mail_to_admin(@projectchore).deliver
            format.html { redirect_to @projectchore, notice: 'Project Task was successfully updated.' }
        		format.json { head :no_content }
      		else
        		format.html { render action: "edit" }
        		format.json { render json: @projectchore.errors, status: :unprocessable_entity }
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

