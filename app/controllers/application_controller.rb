class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  include CurrentUserConcern
  include Pundit
  protect_from_forgery

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :steamid, :psnid, :gamertag])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :steamid, :psnid, :gamertag])
  end
end
