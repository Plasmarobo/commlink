class FrienderController < ApplicationController
	before_filter :authenticate_user
  def add
  	#Friendly little pal me form!
  	@pal = Pal.new
  end

  def create
  	@pal = Pal.new
  	@pal.user_id = session[:user_id]

  	@user = User.find_by_username(params[:username])
    if @user.id == @pal.user_id
      flash[:notice] = "Nice try, you can't friend yourself"
      flash[:color] = "invalid"
      redirect_to :back
      return false
    end
	
  	if(@user)
  		@pal.pal_id = @user.id;
  		if !Pal.where(:user_id => @pal.user_id, :pal_id => @pal.pal_id).any?
  			if @pal.save
  				flash[:notice] = "Added Pal!"
  				flash[:color] = "valid"
  				redirect_to :back
  				return true
  			else
  				flash[:notice] = "Unknown error, try again later"
  				flash[:color] = "invalid"
  				redirect_to :back
  				return true
  			end
  		else
  			flash[:notice] = "This is already a pal!"
  			flash[:color] = "invalid"
  			redirect_to :back
 			return false
 		end
 	else
  		flash[:notice] = "Could not find user"
  		flash[:color] = "invalid"
		  redirect_to :back
  		return false
  	end
  end

  def list
  	#Draw a nifty little list of pals!
    @user = User.find_by_id session[:user_id]
  end

  def remove
  	#Oh noes!
  end

  def delete_attempt
  	if Pal.find_by_id( params[:id] ).destroy
      redirect_to :controller => :sessions, :action => :profile
      return true
    else
      flash[:notice] = "Cannot remove pal"
      flash[:color] = "invalid"
      redirect_to :controller => :sessions, :action => :profile
      return false
    end


  end
end
