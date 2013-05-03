class ProgramsetController < ApplicationController
  def new
  	@programset = Programset.new
  end

  def edit
  	#Just render the form
  end

  def delete
  end
end
