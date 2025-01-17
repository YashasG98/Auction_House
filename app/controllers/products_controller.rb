class ProductsController < ApplicationController

    #to authenticate user before restricted access
    before_action :authenticate_user

    #to initialize a product to be added by the user
    #request: GET
    def add
      @product = Product.new
    end
    
    #to allow the user to add a product to sell
    #request: POST
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
      @product.next_bid_value = params[:start_bid]
      @product.claimed = false
  
      if params[:image]
        @product.image = "#{@current_user.id}_#{@current_user.number_of_products}.jpg"
        image = params[:image]
        File.binwrite("public/assets/product_images/#{@product.image}", image.read)
      end
  
      if @product.save
        flash[:notice] = 'Product added successfully!'
        @current_user.number_of_products += 1
        @current_user.save
        redirect_to("/users/dashboard")      
      else
        @name = params[:name]
        @description = params[:description]
        @start_bid = params[:start_bid]
        @deadline_date = params[:deadline_date]
        @deadline_time = params[:deadline_time]
        @image = params[:image]
        render("products/add")
      end
    end

    #to get the items available for bid for the user
    #request: GET
    def list
      @products = Product.where.not(user_id: @current_user.id).where("deadline_date > ? OR (deadline_date = ? AND deadline_time > ?)", Date.today,Date.today,Time.now.seconds_since_midnight).where.not(bidder_id: @current_user.id)
    end
  
    #to create a new bid
    #request: POST
    def new_bid
      prod_id = params[:id]
      product = Product.find_by(id: prod_id)
      if product.next_bid_value <= @current_user.wallet
        flash[:notice] = "Bid for product successfully!"
        product.bid_value = product.next_bid_value
        product.next_bid_value = 1.2*product.bid_value
        product.bidder_id = @current_user.id
        product.save
        redirect_to("/users/dashboard")
      else
        @products = Product.where.not(user_id: @current_user.id).where("deadline_date > ? OR (deadline_date = ? AND deadline_time > ?)", Date.today,Date.today,Time.now.seconds_since_midnight).where.not(bidder_id: @current_user.id)
        flash.now.alert = "Not enough balance"
        render("products/list")
      end
    end

    #to get the list of items to be claimed by the user
    #request: GET
    def claim_list
      @products = Product.where(bidder_id: @current_user.id).where('deadline_date < ?', Date.today).where(claimed: false)
    end

    #to let the user claim a particular product
    #request: POST
    def claim
      prod_id = params[:id]
      product = Product.find_by(id: prod_id)
      flash[:notice] = "Product claimed successfully!"
      @current_user.wallet -= product.bid_value
      @current_user.save
      prod_owner = User.find_by(id: product.user_id)
      prod_owner.wallet += product.bid_value
      prod_owner.save
      product.claimed = true
      product.save
      redirect_to("/users/dashboard")
    end

    #to get the list of items claimed by the user
    #request: GET
    def claimed
      @products = Product.where(bidder_id: @current_user.id).where(claimed: true)
    end

    #to get the list of items sold by the user
    #request: GET
    def owned
      @products = Product.where(user_id: @current_user.id)
    end
    
  end