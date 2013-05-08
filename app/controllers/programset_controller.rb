class ProgramsetController < ApplicationController
  def new
  	@programset = Programset.new
  end

  def create
    @programset.create_from_parameters(params)
    if @programset.save
      return true
    else
      return false
    end
  end

  def edit
    @programset = Programset.find_by_id params[:id]
  	#Just render the form
  end

  def list
    @programset = Programset.find_by_id params[:id]
  end

  def delete
  	#Just render the delete dialog
  end

  def delete_attempt
  	Programset.delete Programset.find_by_id params[:id]
  end
end
