class CupsController < ApplicationController
  def index
  	
  end
  def show
  	@cup = Cup.find(params[:id])
  	
  end
end
