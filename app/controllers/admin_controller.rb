# -*- encoding: utf-8 -*-
class AdminController < ApplicationController
  layout 'admin'
  include ApplicationHelper
  
  before_filter :check_admin_loggedin, :except => [:login, :enter]


  def set_owner
    if params[:owner].present?
      session[:owner] = params[:owner]
      redirect_to (request.referer.present? ? request.referer : admin_url), notice: "Użytkownik zmieniony. Obecny użytkownik: #{display_user(session[:owner])}"
    else
      redirect_to (request.referer.present? ? request.referer : admin_url), alert: "Nie udało się zmienić użytkownika."
    end
  end


  def index
  end
  
  def login
  end

  def enter
    if params[:login] == "Admin" && params[:password] == "admin"
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
