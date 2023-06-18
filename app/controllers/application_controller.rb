#
# In a standard rails application, all the app's controllers are inherited
# from ApplicationController which inherits from ActionController::Base,
# that contains classes and method definitions for handling HTTP requests
# that enter the application's codebase from the client.
#
# From an OOP point of view, ApplicationController serves at the top of the
# hierarchy of all the application's controllers. Thus, most of the common
# filters/hooks which are required in every part of the applicaion such as:
# authentication, authorization, etc are defined here as this is the first
# place that the HTTP request hits on the application before delegating to
# the specified controller.
#

class ApplicationController < ActionController::Base
  # Methods that are run "before" every controller in the application
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :category, :nucleo, :Isee])

    # For additional fields in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :category, :nucleo, :Isee])
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
