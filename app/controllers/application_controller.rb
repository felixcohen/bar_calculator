class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :current_tab


  def current_tab
  	if !session[:tab_id].nil?
		@current_tab = Tab.find_by(id: session[:tab_id])
	end
  end

end
