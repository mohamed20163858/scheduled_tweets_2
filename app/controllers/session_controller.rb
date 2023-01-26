# frozen_string_literal: true

class SessionController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'logged in sucessfully!'
    else
      render :new, alert: 'invalid email or password!'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'logged out successfully!'
  end
end
