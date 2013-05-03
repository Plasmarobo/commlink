class ProgramsetController < ApplicationController
  def new
  	@programset = Programset.new
  end

  def edit
  	#Just render the form
  end

  def delete
  	#Just render the delete dialog
  end

  def delete_attempt
  	Programset.delete Programset.find_by_id params[:id]
  end
end
