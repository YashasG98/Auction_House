class ProductsController < ApplicationController

    def add
      @product = Product.new
    end
  
    def create
      @product = Product.new
      @product.name = params[:name]
      @product.description = params[:description]
      @product.start_bid = params[:start_bid]
      @product.deadline_date = params[:deadline_date]
      @product.deadline_time = params[:deadline_time].to_time.seconds_since_midnight() 
      @product.user_id = @current_user.id
      @product.bidder_id = 0
      @product.bid_value = 0
      @product.claimed = false
  
      if params[:image]
        @product.image = "#{@current_user.id}_#{@current_user.number_of_products}.jpg"
        image = params[:image]
        File.binwrite("storage/product_images/#{@product.image}", image.read)
      end
  
      if @product.save
        @current_user.number_of_products += 1
        @current_user.save
        redirect_to("/users/#{@current_user.id}/dashboard")
      else
        render("products/add")
      end
    end
  
  end