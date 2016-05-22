require 'TunesTakeoutWrapper'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

   before_filter :find_favorites
   before_action :find_favorites

  def find_favorites
    if session[:user_id].present?
      @user = User.find(session[:user_id])
      session[:favorites] = TunesTakeoutWrapper.check_for_favorites(@user.uid)
    end
  end

end
