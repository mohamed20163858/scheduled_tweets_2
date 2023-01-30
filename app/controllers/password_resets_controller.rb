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
  def edit
    @user = User.find_signed!(params[:token], purpose:"password_reset")
  rescue ActiveSupport::MessageVerifier::InvalidSignature 
    redirect_to sign_in_path, alert: "your token has been expired please try again"
  end 
  def update 
    @user = User.find_signed!(params[:token], purpose:"password_reset")
    if @user.update(password_params)
      redirect_to sign_in_path, notice: 'your password has been updated'
    else 
      render :edit, status: :unprocessable_entity  
    end
  end
  private 
  def password_params 
    params.require(:user).permit(:password, :password_confirmation)
  end
end