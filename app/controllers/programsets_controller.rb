class ProgramsetsController < ApplicationController
  # GET /programsets
  # GET /programsets.json
  def index
    @programsets = Programset.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @programsets }
    end
  end

  # GET /programsets/1
  # GET /programsets/1.json
  def show
    @programset = Programset.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @programset }
    end
  end

  # GET /programsets/new
  # GET /programsets/new.json
  def new
    @programset = Programset.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @programset }
    end
  end

  # GET /programsets/1/edit
  def edit
    @programset = Programset.find(params[:id])
  end

  # POST /programsets
  # POST /programsets.json
  def create
    @programset = Programset.new(params[:programset])
    
    respond_to do |format|
      if @programset.save
        format.html { redirect_to @programset, notice: 'Programset was successfully created.' }
        format.json { render json: @programset, status: :created, location: @programset }
      else
        format.html { render action: "new" }
        format.json { render json: @programset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /programsets/1
  # PUT /programsets/1.json
  def update
    @programset = Programset.find(params[:id])

    respond_to do |format|
      if @programset.update_attributes(params[:programset])
        format.html { redirect_to @programset, notice: 'Programset was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @programset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /programsets/1
  # DELETE /programsets/1.json
  def destroy
    @programset = Programset.find(params[:id])
    @programset.destroy

    respond_to do |format|
      format.html { redirect_to programsets_url }
      format.json { head :no_content }
    end
  end
end
