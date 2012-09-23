class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale


  def set_locale
    begin
      if params[:locale].present?
        session[:locale] = I18n.locale = params[:locale]
        redirect_to request.referer
      elsif session[:locale].present?
        I18n.locale = session[:locale]
      else
        browser_locale = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
        
        if browser_locale.present? && AVAILABLE_LANGUAGES.include?(browser_locale.to_sym)
          session[:locale] = I18n.locale = browser_locale
        else
          session[:locale] = I18n.locale = "pl"
        end
      end      
    rescue
      session[:locale] = I18n.locale = "pl"
      
      redirect_to "/"
    end
  end

end
