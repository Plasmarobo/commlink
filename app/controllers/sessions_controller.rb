class SessionsController < ApplicationController
	before_filter :authenticate_user, :only => [ :home, :profile, :setting ]
	before_filter :save_login_state, :only => [ :login, :login_attempt ]

  def splash

  end

  def login
	#Login Form
  end

  def login_attempt
	authorized_user = User.uauthenticate(params[:username_or_email],params[:login_password])
	if authorized_user
		session[:user_id] = authorized_user.id
		flash[:notice] = "Welcome back, #{authorized_user.username}"
		flash[:color] = "valid"
		redirect_to(:action => 'home')
	else
		flash[:notice] = "Invalid Username or Password"
		flash[:color] = "invalid"
		render "login"
	end
  end

  def logout
	session[:user_id] = nil
	flash[:notice] = "Successfully Logged out"
	flash[:color] = "valid"
	redirect_to :action => 'login'
	
  end

  def home
  	@user = User.find_by_id session[:user_id]
	@player = Player.find_by_id session[:player_id]
  end

  def profile
  end

  def setting
  end
end
