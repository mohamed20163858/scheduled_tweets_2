class PasswordsController < ApplicationController 
    before_action :is_user_logged_in?
  def edit 
  end 

  def update 
    if Current.user.update(update_password_params) 
      redirect_to root_path, notice: 'Password is updated successfully!'
    else  
      render :edit, status: :unprocessable_entity # force hotwire to make form invalid
    end
  end
  private 
  def update_password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end