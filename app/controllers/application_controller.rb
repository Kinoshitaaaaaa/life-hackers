class ApplicationController < ActionController::Base

  before_action :authenticate_admin!, if: :admin_url

  def admin_url
    request.fullpath.include?("/admin")
  end
  before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource)
    if resource == :admin
      admin_user_path
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource)
    if resource == :admin
      new_admin_session_path
    else
      new_user_session_path
    end
  end



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
  end
end
