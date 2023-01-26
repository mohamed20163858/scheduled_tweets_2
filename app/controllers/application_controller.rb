# frozen_string_literal: true

class ApplicationController < ActionController::Base 
    before_action :set_current_user
    def set_current_user
        if session[:user_id]
            Current.user = User.find_by(id: session[:user_id])
        end
    end
    def is_user_logged_in? 
       redirect_to sign_in_path, alert: 'you are not signned in!' if Current.user.nil? 
    end
end
