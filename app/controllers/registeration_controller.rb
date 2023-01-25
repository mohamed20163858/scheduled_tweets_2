class RegisterationController < ApplicationController 
  def new 
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save 
      redirect_to root_path, notice: "logged in sucessfully!"
    else 
      render :new, status: :unprocessable_entity #force hotwire to make form invalid
    end
  end

  private 
  def user_params 
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end