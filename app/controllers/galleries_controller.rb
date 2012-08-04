# -*- encoding: utf-8 -*-
class GalleriesController < AdminController
  
  
  def set_gallery_type
    if params[:type].present?
      session[:type] = params[:type]
      redirect_to galleries_url
    else
      admin_url
    end
  end


  def index
    @galleries = Gallery.where(:owner => session[:owner], :gal_type => session[:type])
  end


  def show
    @gallery = Gallery.find(params[:id])
  end


  def new
    @gallery = Gallery.new
  end


  def edit
    @gallery = Gallery.find(params[:id])
  end


  def create
    @gallery = Gallery.new(params[:gallery])
    @gallery.owner = session[:owner]
    @gallery.gal_type = session[:type]
    
    if @gallery.save
      redirect_to galleries_url, notice: 'Galeria utworzona.'
    else
      render action: "new"
    end
  end

  
  def update
    @gallery = Gallery.find(params[:id])
    
    if @gallery.update_attributes(params[:gallery])
      redirect_to galleries_url, notice: 'Galeria wyedytowana.'
    else
      render action: "edit"
    end
  end
  
  
  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    
    redirect_to galleries_url
  end
end
