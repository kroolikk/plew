# -*- encoding: utf-8 -*-
class AdminController < ApplicationController
  layout 'admin'
  include ApplicationHelper
  
  before_filter :check_admin_loggedin, :except => [:login, :enter]


  def set_section
    if params[:section].present?
      session[:section] = params[:section]
      redirect_to (request.referer.present? ? request.referer : admin_url), notice: "Użytkownik zmieniony. Obecny użytkownik: #{display_user(session[:section])}"
    else
      redirect_to (request.referer.present? ? request.referer : admin_url), alert: "Nie udało się zmienić użytkownika."
    end
  end


  def index
  end
  
  def login
  end

  def enter
    if params[:login] == "PlevaM" && params[:password] == "XniwelP"
      flash[:notice] = "Zalogowano do panelu administracyjnego."
      session[:admin_loggedin] = true
      session[:account_type] = "Admin"
      redirect_to admin_path
    else
      flash[:alert] = "Niepoprawne dane."
      redirect_to admin_login_path
    end
  end

  def logout
    session[:logout_requested] = true
    session[:admin_loggedin] = false
    session[:section] = false
    flash[:notice] = "Zostales wylogowany."
    redirect_to admin_login_path
  end
  
  
  protected
  def check_admin_loggedin
    if session[:admin_loggedin] != true
      redirect_to admin_login_path
    end
  end
end
