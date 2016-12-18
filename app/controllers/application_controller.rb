class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  helper_method :check_for_coach, :current_coach

  def check_for_coach
   if current_user.coach
     @current_coach = current_user.coach
     redirect_to "/coaches/#{@current_coach.id}/practices"
   else
     redirect_to new_coach_path
   end
  end

  def current_coach
    current_user.coach
  end



end
