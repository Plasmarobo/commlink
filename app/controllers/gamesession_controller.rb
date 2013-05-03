class gamesessionController < ApplicationController
  before_filter :authenticate_user
  before_filter :authenticate_player, :only => [ :player ]
  before_filter :authenticate_gm, :only => [ :gm, :manage, :advance, :delete ]
  before_filter :authenticate_gamesession, :only => [ :gm, :player, :manage, :delete, :advance ]

  def authenticate_gm
    @gamesession = gamesessions.find session[:gamesession_id]
    if @gamesession.gm_id == session[:user_id]
      return true
    else
      return false
    end
  end

  def authenticate_gamesession

  end

  def new
      #Just render the new form
  end

  def create

  end

  def list
    #Render the list of valid game sessions
  end

  def select
    @gs = Gamesession.find_by_name params[:session_name]
    Group.find_by_gs_id @gs.id do |g| 
      if g.player_id == params[:player_id] 
        session[:gamesession_id] = @gs.id
        return true
      end
      return false
    end
    

  end

  def gm
  end

  def select_gm
  end

  def player
  end

  def manage
  end

  def delete
  end

  def advance
    #Advance the turn
  end


end
