class FrontSectionController < ApplicationController


  def auth_gallery
    if params[:section].present?      
      @galleries = Gallery.where(:section => params[:section], :gal_type => GAL_TYPE[0])
      
      if params[:id].present?
        @selected_gallery = Gallery.find_by_id(params[:id])
      else
        @selected_gallery = @galleries.first
      end
    else
      redirect_to root_url
    end    
  end


  def com_gallery
    if params[:section].present?      
      @galleries = Gallery.where(:section => params[:section], :gal_type => GAL_TYPE[1])
      
      if params[:id].present?
        @selected_gallery = Gallery.find_by_id(params[:id])
      else
        @selected_gallery = @galleries.first
      end
    else
      redirect_to root_url
    end        
  end

  
  def vid
    if params[:section].present?      
      @vids = [] #Vid.where(:section => params[:section])
      
      if params[:id].present?
        @selected_vid = Vid.find_by_id(params[:id])
      else
        @selected_vid = @vids.first
      end
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
