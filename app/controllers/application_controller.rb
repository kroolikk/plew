class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale


  def set_locale
    
    Rails.logger.info '------------------------------------------------------------'

    begin
      if params[:locale].present?
        Rails.logger.info '------------------------------------------------------------1'
        
        session[:locale] = I18n.locale = params[:locale]
        redirect_to request.referer
      elsif session[:locale].present?
        Rails.logger.info '------------------------------------------------------------2'

        I18n.locale = session[:locale]
      else
        Rails.logger.info '------------------------------------------------------------3'

        browser_locale = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
        
        if browser_locale.present? && AVAILABLE_LANGUAGES.include?(browser_locale.to_sym)
          Rails.logger.info '------------------------------------------------------------4'
          
          session[:locale] = I18n.locale = browser_locale
        else
          Rails.logger.info '------------------------------------------------------------5'

          session[:locale] = I18n.locale = "pl"
        end
      end      
    rescue
      Rails.logger.info '------------------------------------------------------------6'

      session[:locale] = I18n.locale = "pl"
      
      redirect_to "/"
    end
  end

end
