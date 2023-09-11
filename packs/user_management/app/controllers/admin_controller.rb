class AdminController < ActionController::Base
  layout 'admin'
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_admin!
  load_and_authorize_resource :admin

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :current_password])
  end
  
  def current_ability
    @current_ability ||= Ability.new(current_admin)
  end
  
end
