class ProgramsetTemplatesController < ApplicationController
  # GET /programset_templates
  # GET /programset_templates.json
  def index
    @programset_templates = ProgramsetTemplate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @programset_templates }
    end
  end

  # GET /programset_templates/1
  # GET /programset_templates/1.json
  def show
    @programset_template = ProgramsetTemplate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @programset_template }
    end
  end

  # GET /programset_templates/new
  # GET /programset_templates/new.json
  def new
    @programset_template = ProgramsetTemplate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @programset_template }
    end
  end

  # GET /programset_templates/1/edit
  def edit
    @programset_template = ProgramsetTemplate.find(params[:id])
  end

  # POST /programset_templates
  # POST /programset_templates.json
  def create
    @programset_template = ProgramsetTemplate.new(params[:programset_template])

    respond_to do |format|
      if @programset_template.save
        format.html { redirect_to @programset_template, notice: 'Programset template was successfully created.' }
        format.json { render json: @programset_template, status: :created, location: @programset_template }
      else
        format.html { render action: "new" }
        format.json { render json: @programset_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /programset_templates/1
  # PUT /programset_templates/1.json
  def update
    @programset_template = ProgramsetTemplate.find(params[:id])

    respond_to do |format|
      if @programset_template.update_attributes(params[:programset_template])
        format.html { redirect_to @programset_template, notice: 'Programset template was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @programset_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /programset_templates/1
  # DELETE /programset_templates/1.json
  def destroy
    @programset_template = ProgramsetTemplate.find(params[:id])
    @programset_template.destroy

    respond_to do |format|
      format.html { redirect_to programset_templates_url }
      format.json { head :no_content }
    end
  end
end
