class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: %i[home index]
  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:type_of_user])
    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:type_of_user])
  end

  include Pundit::Authorization
  # after_action :verify_authorized, except: :index, unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?
  #rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end
  # def skip_pundit?
  #   devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  # end
end
