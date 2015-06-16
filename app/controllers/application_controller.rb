class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authorize

  private

    delegate :allow?, to: :current_permission
    helper_method :allow?

    def current_permission
      @current_permission ||= Permission.new(current_user)
    end

    def authorize
      unless current_permission.allow?(params[:controller], params[:action])
        redirect_to root_url, alert: "Not authorized"
      end
    end
end
