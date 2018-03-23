class Api::ItemController < ApplicationController

	skip_before_filter :verify_authenticity_token

	respond_to :json

    def intialize
  	    @http_status = 200
   		@http_response = {}
  	end

	  def index 
		    user = Item.all
		    @http_response = user
     	  @http_status = 200
      	render :json => @http_response, :status => @http_status
    end
    
    def show
    	item = Item.all
      hash = {:itemDetailsList => item }
    	@http_response = hash
    	@http_status = 200
    	render :json => @http_response, :status => @http_status
    end	

    def addItem
    	item = Item.new(item_params)
      	if item.save
            @http_response = item
            @http_status = 200
            status = true
            @http_response = {
                      :result => "success",
                      :message => "Item Added!"
                      }.to_json
            @http_status = 200
            status = false
			#item.update_attribute(:available, false);
      	else
        		@http_response = {
                      :result => "failed",
                      :message => "Error!"
                      }.to_json
        		@http_status = 400
            status = false
        end
          render :json => @http_response, :status => @http_status  
    end

    def editItem
        item = Item.find_by(:id => params[:id])
            if item
              item.update(update_params)
              item_name = item.name;
              item.update_attribute(:name,item_name)
              code = item.code;
              item.update_attribute(:code,code)
              condition= item.condition
              item.update_attribute(:condition,condition)
              available = item.available
              item.update_attribute(:available,available)
              @http_response = {
                :result => "success",
                :message => "Item Updated!"
                }.to_json
            else
    
              @http_response = {
                :result => "failed",
                :message => "User Not Found!"
                }.to_json
            end  
        render :json => @http_response
    end

    def borrowItem
    	itemCheck = Item.find_by(name: params[:name],available: true)
    	
    	if itemCheck 
    		itemID = itemCheck.id
    		itemBorrow = Item.find_by(id: itemID)
	    	item = BorrowedItem.new
	    	item.item_id = itemID
	    	item.borrowers_name = params[:borrowers_name]
	    	item.borrowers_student_number = params[:borrowers_student_number]
	    	item.borrowers_course = params[:borrowers_course]
	    	item.borrowers_year_and_section = params[:borrowers_year_and_section]

	    	if item.save
	            @http_response = item
	            @http_status = 200
	            itemBorrow.update_attribute(:available,false)

              @http_response =
                {
                        :result => "success",
                        :message => "Item Borrowed!"
                        }.to_json
              @http_status = 200
	      	else
	        		@http_response = 
	        			{
	                      :result => "failed",
	                      :message => "Error!"
	                      }.to_json
	        		@http_status = 400
	        end
	    else
	    	@http_response = {
	                      :result => "failed",
	                      :message => "No available"
	                      }.to_json
	        @http_status = 400
	    end    	
          render :json => @http_response, :status => @http_status  
    end

    def returnItem
    	item = BorrowedItem.find_by(:id => params[:id])
      itemCheck = Item.find_by(:id => params[:item_id])
    	if item
              item.update_attribute(:is_returned,true)
              itemCheck.update_attribute(:available,true)
              @http_response = {
                :result => "success",
                :message => "Item Returned!"
                }.to_json
      	else
        		@http_response = {
                      :result => "failed",
                      :message => "Error!"
                      }.to_json
        		@http_status = 400
        end
          render :json => @http_response, :status => @http_status  
    end

    def searchBorrowedItem
    	item = BorrowedItem.where(:borrowers_student_number => params[:borrowers_student_number])
    	if item
              @http_response = item
      	else
        		@http_response = {
                      :result => "failed",
                      :message => "Error!"
                      }.to_json
        		@http_status = 400
        end
          render :json => @http_response, :status => @http_status 
    end

    def listBorrowedItem
    	item = BorrowedItem.where(:is_returned => false)
    	hash = {:items => item }
    	if item
              @http_response = hash
      	else
        		@http_response = {
                      :result => "failed",
                      :message => "Error!"
                      }.to_json
        		@http_status = 400
        end
          render :json => @http_response, :include=> [:item], :status => @http_status 
    end

private

  def item_params
     params.permit(:name,:condition,:code)
  end

  def update_params
     params.permit(:name,:code,:condition,:available)
  end

  def borrow_params
     params.permit(:item_id,:borrowers_name, :borrowers_student_number)
  end

  def return_params
     params.permit(:is_returned)
  end

end
