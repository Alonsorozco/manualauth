class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    #esta intancia se colocan los datos que viene del formulario
    respond_to do |format|
      if @user.save 
        session[:user_id]= @user.id
        format.html {redirect_to root_path}
      else 
        format.html {render :new}
      end 
    end
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
    #parametro que se solicitan , se puede ver en el servidor
  end
end
