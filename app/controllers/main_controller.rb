# frozen_string_literal: true

class MainController < ApplicationController
  def index
    # flash.now[:notice] = "logged in sucessfully!"
    # flash.now[:alert] = "error! failed to log in"
    @user = User.find_by(id: session[:user_id])
  end
end
