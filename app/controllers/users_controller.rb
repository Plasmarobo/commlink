class UsersController < ApplicationController
  before_filter :save_login_state, :only => [ :new, :create ]

  def new
	@user = User.new
  end
  def create
	@user = User.new(params[:user])
		
		if @user.save
			flash[:notice] = "User Creation successful, please login."
			flash[:color] = "valid"
			redirect_to :controller => :sessions, :action => :login
		else
			flash[:notice] = "Oops! Something went wrong..."
			flash[:color] = "invalid"
			render "new"
		end
  end
end
