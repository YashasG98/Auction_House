class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:name],
      contact: params[:contact],
      address: params[:address],
      password: params[:password]
    )
    if @user.save
      session[:user_id] = @user.id
      redirect_to("/users/#{@user.id}/dashboard")
    else
      render("/users/new")
    end
  end

  def dashboard
  end

  def login
    @user = User.find_by(contact: params[:contact])
    if @user && @user.authenticate(params[:password])
      flash[:notice] = nil
      session[:user_id] = @user.id
      redirect_to("/users/#{@user.id}/dashboard")
    else
      flash[:alert] = "Invalid contact number/password combination"
      @contact = params[:contact]
      @password = params[:password]
      render("/users/login_form")
    end
  end

  def login_form
  end

end