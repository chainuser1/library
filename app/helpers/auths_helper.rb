module AuthsHelper
  def log_in(user)
    session[:user_username]=user.username
    session[:user_role]=user.role
  end
  def current_user
    @current_user ||= User.find_by(username: session[:user_username])
  end
  def logged_in?
    !current_user.nil?
  end
  def is_admin?
    if session[:user_role]==0
      return true
    else
      return false
    end
  end

=begin
  Profile Checker if there is a profile associated with a specific user
=end
 def profile_checker?
   user=User.find_by(username: current_user.username)
   if !user.profile.nil?
     return true
   else
     return false
   end
 end
  def authenticate_user
    if !logged_in?
      redirect_to login_auths_path
    end
  end
end
