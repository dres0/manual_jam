class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Loguead Correctamente'
    else
      flash.now[:notice] = 'Email o password invalida'
      render action: :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Signed out successfully.'
  end
end