class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  layout :set_layout

  def set_layout
    authenticated? ? "application" : "authentication"
  end

  def authorize_admin!
    redirect_to root_path, alert: "Not authorized" unless Current.user&.admin?
  end
end
