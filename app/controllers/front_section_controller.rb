class FrontSectionController < ApplicationController


  def select_section
    if params[:section].present?
      session[:section] = params[:section]
      redirect_to auth_gallery_url
    else
      redirect_to root_url
    end
  end

  def auth_gallery
  end

  def com_gallery
  end

  def review
  end

  def contact
  end
end
