class FrontSectionController < ApplicationController

  def auth_gallery_categories
    if params[:section].present?      
      if params[:section] == SECTION[1]
        redirect_to auth_gallery_url(:section => params[:section], :cat => 'wszystkie')
      else
        categories = Gallery.where(["section = '#{params[:section]}' AND gal_type = '#{GAL_TYPE[0]}' AND label IS NOT NULL"])
        if categories.present?
          @categories = categories.collect.collect{|g| g.label}.uniq
        else
          @categories = []
        end        
      end
    else
      redirect_to root_url
    end    
  end


  def auth_gallery
    if params[:section].present?
      if params[:cat].present? && params[:cat] != 'wszystkie'
        @galleries = Gallery.where(:section => params[:section], :gal_type => GAL_TYPE[0], :label => params[:cat])
      else
        @galleries = Gallery.where(:section => params[:section], :gal_type => GAL_TYPE[0])
      end
      
      if params[:id].present?
        @selected_gallery = Gallery.find_by_id(params[:id])
      else
        @selected_gallery = @galleries.first
      end
    else
      redirect_to root_url
    end    
  end


  def com_gallery_categories
    if params[:section].present?      
      if params[:section] == SECTION[1]
        redirect_to com_gallery_url(:section => params[:section], :cat => 'wszystkie')
      else
        categories = Gallery.where(["section = '#{params[:section]}' AND gal_type = '#{GAL_TYPE[1]}' AND label IS NOT NULL"])
        if categories.present?
          @categories = categories.collect.collect{|g| g.label}.uniq
        else
          @categories = []
        end
      end     
    else
      redirect_to root_url
    end    
  end

  
  def com_gallery
    if params[:section].present?
      if params[:cat].present? && params[:cat] != 'wszystkie'
        @galleries = Gallery.where(:section => params[:section], :gal_type => GAL_TYPE[1], :label => params[:cat])
      else
        @galleries = Gallery.where(:section => params[:section], :gal_type => GAL_TYPE[1])
      end
      
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
      @vids = Vid.all
      
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
