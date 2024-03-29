class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  def authenticate_user
    unless session[:user_id]
      redirect_to(:controller => 'sessions', :action => 'login')
      return false
    else
      #set user object to current suers
      @current_user = User.find_by_id session[:user_id]
      if @current_user
        return true
      else
        session[:user_id] = nil
        redirect_to(:controller => 'sessions', :action => 'login')
        return false
      end
    end
  end

  def authenticate_player
    unless session[:player_id]
      redirect_to(:controller => 'player', :action => 'set')
      return false
    else
      current_player = Player.find_by_id session[:player_id]
      if current_player.user_id == session[:user_id]
        return true
      else
        redurect_to(:controller => 'player', :action => 'set')
        return false
      end
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

  def is_logged_in?
    if session[:user_id]
      return true
    else
      return false
    end
  end
end
