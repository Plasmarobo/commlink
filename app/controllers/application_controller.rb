class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
	def authenticate_user
		unless session[:user_id]
			redirect_to(:controller => 'sessions', :action => 'login')
			return false
		else
			#set user object to current suers
			@current_user = User.find session[:user_id]
			return true
		end
	end

	def authenticate_player
		unless session[:player_id]
			redirect_to(:controller => 'player', :action => 'view')
			return false
		else
			@current_player = Player.find session[:player_id]
			return true
		end
	end

	def save_login_state
		if session[:user_id]
			redirect_to(:controller => 'sessions', :action => 'home')
			return false
		else
			return true
		end
	end
end
