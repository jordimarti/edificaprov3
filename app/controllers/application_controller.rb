class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  around_action :switch_locale
  include Pundit

  def switch_locale(&action)
    logger.debug "* Accept-Language: #{request.env['HTTP_ACCEPT_LANGUAGE']}"
    locale = current_user.try(:locale) || extract_locale_from_accept_language_header
    if locale == nil
      locale = I18n.default_locale
    end
    logger.debug "* Locale set to '#{locale}'"
    I18n.with_locale(locale, &action)
  end

  def current_organization
    if session[:organization_id].present?
      @current_organization ||= current_user.organizations.find(session[:organization_id])
    else
      @current_organization = 0
    end
  end
  helper_method :current_organization

  set_current_tenant_through_filter
  before_action :set_tenant

  def set_tenant
    if current_organization != nil && current_organization != 0
      set_current_tenant(current_organization)
    else
      set_current_tenant(current_user)
    end
  end

  

	protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :role, :locale])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :role, :locale])
  end

  private
  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end
end
