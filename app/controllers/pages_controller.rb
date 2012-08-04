# -*- encoding: utf-8 -*-
class PagesController < AdminController


  def index
    @pages = Page.where(:owner => session[:owner])
  end


  def show
    @page = Page.find(params[:id])
  end


  def new
    @page = Page.new
  end


  def edit
    @page = Page.find(params[:id])
  end


  def create
    @page = Page.new(params[:page])

      if @page.save
        redirect_to pages_url, notice: 'Dodano stronę informacyjną.'
      else
        render action: "new"
      end
  end


  def update
    @page = Page.find(params[:id])


      if @page.update_attributes(params[:page])
        redirect_to pages_url, notice: 'Zaktualizowano stronę informacyjną.'
      else
        render action: "edit"
      end

  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    redirect_to pages_url
  end
end
