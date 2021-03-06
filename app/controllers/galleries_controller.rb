# -*- encoding: utf-8 -*-
class GalleriesController < AdminController


  def sort
    @gallery = Gallery.find(params[:id])
    if @gallery.present?
      @photos = Photo.where(:gallery_id => @gallery.id).order("position ASC")
    else
      @photos = []
    end

    @photos.each do |photo|
      photo.position = params['ph_li'].index(photo.id.to_s) + 1
      photo.save 
    end

    render :nothing => true
  end

  
  def set_gallery_type
    if params[:type].present?
      session[:type] = params[:type]
      redirect_to galleries_url
    else
      admin_url
    end
  end


  def index
    @galleries = Gallery.where(:section => session[:section], :gal_type => session[:type])
  end


  def show
    @gallery = Gallery.find_by_id(params[:id])
    if @gallery.present?
      @photos = Photo.where(:gallery_id => @gallery.id).order("position ASC")
    else
      @photos = []
    end
  end


  def new
    @gallery = Gallery.new
  end


  def edit
    @gallery = Gallery.find(params[:id])
  end


  def create
    @gallery = Gallery.new(params[:gallery])
    @gallery.section = session[:section]
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
