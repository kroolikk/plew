class FrontSectionController < ApplicationController


  def auth_gallery
    if params[:section].present?

      @galleries = Gallery.where(:section => params[:section], :gal_type => GAL_TYPE[0])

    else
      redirect_to root_url
    end    
  end

  def com_gallery
    if params[:section].present?
      
      @galleries = Gallery.where(:section => params[:section], :gal_type => GAL_TYPE[1])
      
    else
      redirect_to root_url
    end        
  end

  def info
    if params[:section].present?
      
      @review = Page.where(:section => params[:section], :label => PAGE_LABELS[0][1]).first
      @contact = Page.where(:section => params[:section], :label => PAGE_LABELS[1][1]).first
      
    else
      redirect_to root_url
    end
  end
end
