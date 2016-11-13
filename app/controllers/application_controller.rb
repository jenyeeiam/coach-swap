class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

   def current_user
     @current_user ||= Coach.find_by_id(session[:coach_id]) if session[:coach_id]
   end

    def logged_in?
      current_user != nil
    end

    # def create
    #   if params.has_key?("practices")
    #     Practice.create(practice_params(params["practice"]))
    #   else
    #     params["practices"].each do |practice|
    #       if practice["day_of_week"] != ''
    #         Practice.create(practice_params(practice))
    #       end
    #     end
    #   end
    # end



end
