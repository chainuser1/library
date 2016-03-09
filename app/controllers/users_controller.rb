class UsersController < ApplicationController
  require 'bcrypt'
  layout 'application'

  def new
    if logged_in?
      redirect_to root_path
    else
      @user=User.new
    end
  end
  def register
     @user=User.new(user_params_register)
       respond_to do |format|
         if @user.save
           format.html {redirect_to root_path}
         else
           format.html {render 'new'}
         end
       end
  end
  private
  def user_params_register
    params.require(:user).permit(:username,:password,:password_confirmation)
  end

end
