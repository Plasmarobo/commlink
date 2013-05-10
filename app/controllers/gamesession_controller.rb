class GamesessionController < ApplicationController
  before_filter :authenticate_user
  before_filter :authenticate_gm, :only => [ :manage, :advance, :delete ]
  before_filter :authenticate_gamesession, :only => [ :gm, :player, :manage, :delete, :advance ]

  def authenticate_gm
    if params[:id]
      session[:gamesession_id] = params[:id]
    end
    @gamesession = Gamesession.find_by_id session[:gamesession_id]
    if !session[:gamesession_id]
      redirect_to controller: :gamesession, action: :list
      return false
    end
    if @gamesession.gm_id == session[:user_id]
      return true
    else
      redirect_to controller: :gamesession, action: :list
      return false
    end
  end

  def authenticate_gamesession
    if !session[:gamesession_id]
      redirect_to :list
      return false
    end
    @gamesession = Gamesession.find_by_id session[:gamesession_id]
    if @gamesession.players.include? session[:player_id] or @gamesession.gm_id == session[:user_id]
      return true
    else
      redirect_to :list
      return false
    end
  end

  def new
      @player = nil
      @user = User.find_by_id session[:user_id]
      @name = Gamesession.new
      #Just render the new form
  end

  def create
    @game.create_from(params)
    if !@game.save
      redirect :back
      return false
    else
      session[:gamesession_id] = @game.id
      redirect_to :controller => :gamesession, :action => :manage
      return true
    end
  end

  def list
    @user = User.find_by_id session[:user_id]
    @players = Player.find_all_by_user_id session[:user_id]
  end

  def select
    gs = Gamesession.find_by_name params[:name]
    Group.find_by_gamesession_id @gs.id do |g| 
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
    gs = Gamesession.find_by_name params[:name]
    if g.gm_id == session[:user_id]
      session[:gamesession_id] = gs.id
      return true
    end
    redirect_to :back
    return false
  end

  def player
    @user = User.find_by_id session[:user_id]
    @game = Gamesession.find_by_id params[:game_id]
    @player = Player.find_by_id params[:player_id]
    if !@player 
      redirect_to controller: :player, action: :sel
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
