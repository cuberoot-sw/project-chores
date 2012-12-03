class ProjectchoresController < ApplicationController

  #the user should be logged in to perform any operation
  before_filter :authenticate_user!, :except => [:show, :index]
  
  # Added for CanCan Authorization
  load_and_authorize_resource

  def index
        
      # @projectchores = Projectchore.all
      # myindexrender @projectchores 

      #invoke search
      # tasksearch

    # for Pagination
      # @projectchores = Projectchore.page(params[:page]).per(4)
            @projectchores = Projectchore.search do 
              paginate :page => params[:page], :per_page => 4
            end
       # myindexrender @projectchores


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
  

    # Task search functionality
    def tasksearch
       Rails.logger.info "**************ENTER SEARCH**************************************"
      @search = Sunspot.search(Projectchore) do
        fulltext params[:search]
      end
      @projectchores = @search
      # debugger
      # myindexrender @projectchores
      respond_to do |format|
      format.html 
      format.json { render json: @projectchores }
      end
      Rails.logger.info "**************EXIT SEARCH**************************************" 
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
          UserMailer.delay.registration_confirmation(@projectchore)
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
            Rails.logger.info "***************INSIDE UPDATE*********************"
            UserMailer.delay.send_mail(@projectchore)
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

