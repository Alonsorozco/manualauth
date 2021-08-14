class SessionsController < ApplicationController
  def new
    #crea nuevo usuario ,
    @user = User.new
  end

  def create
    #cliente inicia seccion ,buscar a cliente y ver si existe en la base de datos , 

    @user = User.find_by(email: params[:user][:email])
    pass = BCrypt::Password.new(@user.password_digest)
    respond_to do |format|
      if @user.present? && pass == params[:user][:email]
        session[:user_id] = @user.id
        format.html {rediret_to root_path}
      else
        format.html {render :new}
      end
    end 
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
