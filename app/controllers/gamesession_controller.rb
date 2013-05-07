class GamesessionController < ApplicationController
  before_filter :authenticate_user
  #before_filter :authenticate_player, :only => [ :player ]
  before_filter :authenticate_gm, :only => [ :manage, :advance, :delete ]
  before_filter :authenticate_gamesession, :only => [ :gm, :player, :manage, :delete, :advance ]

  def authenticate_gm
    @gamesession = Gamesession.find_by_id session[:gamesession_id]
    if @gamesession.gm_id == session[:user_id]
      return true
    else
      redirect_to 
      return false
    end
  end

  def authenticate_gamesession

  end

  def new
      @player = nil
      @user = User.find_by_id session[:user_id]
      #Just render the new form
  end

  def create
    @game = Gamesession.new(params[:name], params[:nodelist_data], params[:playerlist_data])
    if !@game.save
      redirect :back
      return false
    else
      redirect_to :controller => :gamesession, :action => :manage
      return true
  end

  def list
    #Render the list of valid game sessions
    @user = User.find_by_id session[:user_id]
    @players = Player.find_all_by_user_id session[:user_id]
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
    @user = User.find_by_id session[:user_id]
  end

  def select_gm
  end

  def player
    @user = User.find_by_id session[:user_id]
    @game = Gamesession.find_by_id params[:game_id]
    @player = Player.find_by_id params[:player_id]
    if !@player 
      redirect_to :back
      return false
    end

  end

  def manage
  end

  def delete
  end

  def advance
    #Advance the turn
  end


end
