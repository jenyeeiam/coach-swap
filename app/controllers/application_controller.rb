class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_coach!

  helper_method :current_user, :logged_in?

   def current_user
     @current_user ||= Coach.find_by_id(session[:coach_id]) if session[:coach_id]
   end

    def logged_in?
      current_user != nil
    end

end
