class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # This method allows us to accept additional parameters for the user sign-up and account update processes.
  def configure_permitted_parameters
    # For sign-up process, permit the :name parameter along with the other required parameters.
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])

    # For the account update process, permit the :name parameter along with other parameters that might be needed for updating the user's account.
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  # This method determines where to redirect after a successful sign-in.
  def after_sign_in_path_for(resource)
    # Redirect to the user index page or any other path you want to send the user to after sign-in
    users_path # or use 'user_path(current_user)' if you want to redirect to the user's show page
  end
end
