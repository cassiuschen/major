class ApplicationController < ActionController::Base
  before_action :logging
  after_action :store_location, only: [:index, :show]
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery

  if Rails.env.production?
    # some bots using some *strange* format to request urls
    # that would trigger missing template exception,
    # so this will reject those request, but you can adjust to your logic
    rescue_from ActionView::MissingTemplate do
      head :not_acceptable
    end

    # rails 4 will raise this exception when action can not respond request format
    rescue_from ActionController::UnknownFormat do
      head :not_acceptable
    end

    rescue_from ArgumentError do
      head :bad_request
    end

    rescue_from EncodingError do
      head :bad_request
    end

    rescue_from ActionController::InvalidCrossOriginRequest do
      head :bad_request
    end

    rescue_from ActionController::ParameterMissing do
      head :bad_request
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html do
        if request.format == Mime::HTML
          session[:previous_url] = request.fullpath
        end

        redirect_to '/403', alert: exception.message
      end

      format.json do
        head :forbidden
      end

      format.js do
        head :forbidden
      end
    end
  end

  def redirect_stored_or(path, flash = {})
    flash.each_pair do |k, v|
      flash[k] = v
    end
    redirect_to(session.delete(:previous_url) || path, flash)
  end

  def redirect_back_or(path, flash = {})
    flash.each_pair do |k, v|
      flash[k] = v
    end
    url = if params[:redirect_from].present? && !params[:redirect_from].start_with?('/403')
            params[:redirect_from]
          elsif session[:previous_url].present?
            session[:previous_url]
          else
            path
          end
    redirect_to(url, flash)
  end

  helper_method :redirect_stored_or, :redirect_back_or

  protected

  def require_signed_in
    return if current_user

    if request.format == Mime::HTML
      session[:previous_url] = request.fullpath

      redirect_to '/403'
    else
      head :forbidden
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).concat []
    devise_parameter_sanitizer.for(:account_update).concat []
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def store_location(url=nil)
    return if request.format != Mime::HTML || request.xhr? || !request.get?

    session[:previous_url] = request.fullpath
  end

  def after_sign_in_path_for(resource)
    if current_user.stuff?
      stuff_dashboard_path
    elsif current_user.student?
      root_path
    else
      super
    end
  end

  def require_stuff
    redirect_to '/403' unless current_user and current_user.stuff?
  end

  def allow_iframe_load
    response.headers['X-XSS-Protection'] = '0'
  end

  private

  def logging
    logger.info "Current user: #{user_signed_in? ? current_user.name : 'guest'}"
    logger.info "Session: #{session.to_hash}"
    logger.info "> IP #{request.ip} Who #{user_signed_in? ? current_user.id : 'guest'} By #{request.method} What #{request.fullpath} When #{Time.now} From #{request.env['action_dispatch.request.unsigned_session_cookie']['previous_url']}"
  end

  def trim_param_id
    params[:id] and params[:id].gsub! /[^\w]$/, ''
  end
end
