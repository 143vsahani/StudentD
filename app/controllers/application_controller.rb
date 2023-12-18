class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    dashboard_path_for(resource)
  end

  def after_sign_up_path_for(resource)
    dashboard_path_for(resource)
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end

  private

  def dashboard_path_for(resource)
    case resource.role
    when 'student'
      student_dashboard_path
    when 'teacher'
      teacher_dashboard_path
    else
      root_path
    end
  end
end
