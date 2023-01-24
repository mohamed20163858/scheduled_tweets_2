class MainController < ApplicationController 
  def index
    flash.now[:notice] = "logged in sucessfully!"
    flash.now[:alert] = "error! failed to log in"
  end
end