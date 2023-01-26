class PasswordResetsController < ApplicationController 
  def new 
  end 
  def create 
    @user = User.find_by(email: params[:email])
    if @user.present? 
      #Send email
       PasswordMailer.with(user: @user).reset.deliver_later
    end 
    redirect_to root_path, notice: "if user is exisiting in our database we will send an email"
  end
end