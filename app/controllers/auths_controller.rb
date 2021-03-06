class AuthsController < ApplicationController
  layout 'application'
  def login
    if logged_in?
      redirect_to root_path
    else
      render 'login'
    end

  end
  def verify

      user = User.find_by(username: params[:user][:username])
      #render plain:  user && user.authenticate(params[:user][:password])? true : false
      if user && user.authenticate(params[:user][:password])
        log_in user
        redirect_to root_path
      else
        flash[:danger] = 'Invalid email/password combination' # Not quite right!
        render 'login'
      end
  end
  def logout
    reset_session
    redirect_to root_path
  end
end
