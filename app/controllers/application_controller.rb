class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :check_tab
	def check_tab
	      if (session[:tab_id].present?)
		    @tab = Tab.find(session[:tab_id])
			end
	end

end
