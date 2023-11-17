class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # This method allows us to accept additional parameters for the user sign-up and account update processes.
  def configure_permitted_parameters
    # For sign-up process, permit the :name parameter along with the other required parameters.
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])

    # For the account update process, permit the :name parameter along with other parameters that might be needed for updating the user's account.
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
