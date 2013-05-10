class GamesessionsController < ApplicationController
  before_filter :authenticate_user
  before_filter :authenticate_gm, only: [:edit, :delete, :update]
  before_filter :authenticate_gamesession, only: [:show ]
  
  def authenticate_gm
    if params[:id]
      session[:gamesession_id] = params[:id]
    end
    gamesession = Gamesession.find_by_id session[:gamesession_id]
    if !session[:gamesession_id]
      redirect_to controller: :gamesession, action: :index
      return false
    end
    if gamesession.gm_id == session[:user_id]
      return true
    else
      redirect_to controller: :gamesession, action: :edit
      return false
    end
  end

  def authenticate_gamesession
    if !session[:gamesession_id]
      redirect_to :index
      return false
    end
    if !session[:player_id]
      redirect_to controller: :player, action: :select
      return false
    end
    player = Player.find_by_id session[:player_id] 
    gamesession = Gamesession.find_by_id session[:gamesession_id]
    if gamesession.players.include? player  or @gamesession.gm_id == session[:user_id]
      return true
    else
      redirect_to :list
      return false
    end
  end

  # GET /gamesessions
  # GET /gamesessions.json
  def index
    @gamesessions = Gamesession.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gamesessions }
    end
  end

  # GET /gamesessions/1
  # GET /gamesessions/1.json
  def show
    @gamesession = Gamesession.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gamesession }
    end
  end

  # GET /gamesessions/new
  # GET /gamesessions/new.json
  def new
    @gamesession = Gamesession.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gamesession }
    end
  end

  # GET /gamesessions/1/edit
  def edit
    @gamesession = Gamesession.find(params[:id])
  end

  # POST /gamesessions
  # POST /gamesessions.json
  def create
    @gamesession = Gamesession.new(params[:gamesession])

    respond_to do |format|
      if @gamesession.save
        format.html { redirect_to @gamesession, notice: 'Gamesession was successfully created.' }
        format.json { render json: @gamesession, status: :created, location: @gamesession }
      else
        format.html { render action: "new" }
        format.json { render json: @gamesession.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gamesessions/1
  # PUT /gamesessions/1.json
  def update
    @gamesession = Gamesession.find(params[:id])

    respond_to do |format|
      if @gamesession.update_attributes(params[:gamesession])
        format.html { redirect_to @gamesession, notice: 'Gamesession was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gamesession.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gamesessions/1
  # DELETE /gamesessions/1.json
  def destroy
    @gamesession = Gamesession.find(params[:id])
    @gamesession.destroy

    respond_to do |format|
      format.html { redirect_to gamesessions_url }
      format.json { head :no_content }
    end
  end
end
