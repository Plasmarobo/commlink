class NpcsController < ApplicationController
  # GET /npcs
  # GET /npcs.json
  def index
    @npcs = Npc.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @npcs }
    end
  end

  # GET /npcs/1
  # GET /npcs/1.json
  def show
    @npc = Npc.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @npc }
    end
  end

  # GET /npcs/new
  # GET /npcs/new.json
  def new
    @npc = Npc.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @npc }
    end
  end

  # GET /npcs/1/edit
  def edit
    @npc = Npc.find(params[:id])
  end

  # POST /npcs
  # POST /npcs.json
  def create
    @npc = Npc.new(params[:npc])

    respond_to do |format|
      if @npc.save
        format.html { redirect_to @npc, notice: 'Npc was successfully created.' }
        format.json { render json: @npc, status: :created, location: @npc }
      else
        format.html { render action: "new" }
        format.json { render json: @npc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /npcs/1
  # PUT /npcs/1.json
  def update
    @npc = Npc.find(params[:id])

    respond_to do |format|
      if @npc.update_attributes(params[:npc])
        format.html { redirect_to @npc, notice: 'Npc was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @npc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /npcs/1
  # DELETE /npcs/1.json
  def destroy
    @npc = Npc.find(params[:id])
    @npc.destroy

    respond_to do |format|
      format.html { redirect_to npcs_url }
      format.json { head :no_content }
    end
  end
end
