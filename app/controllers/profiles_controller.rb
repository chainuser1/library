class ProfilesController < ApplicationController
  include AuthsHelper
  layout 'application'
  before_action :authenticate_user#, :except=>[]
  before_action :set_profile,:only=>[:manifest,:change,:update,:destroy]
  after_action :redirect_logout, :only=>[:destroy]
  def new
    if profile_checker?
      redirect_to profile_path(current_user.username)
    else
      @profile=Profile.new
      render 'new'
    end
  end

  def create
     @profile=Profile.new(profile_params)
     respond_to do |format|
       if @profile.save
         format.html {redirect_to profile_path(current_user.username)}
       else
         format.html{render 'new'}
       end
     end
  end
  def manifest
    render 'show'
  end
  def update
    respond_to do |f|
      if @profile.update(profile_params)
        f.html {redirect_to manifest_profile_path}
      else
        render 'edit'
      end
    end
  end
  def change
    render 'edit'
  end
  def destroy
    @user.destroy
  end
  private
  def redirect_logout
    redirect_to logout_auths_path
  end
  def profile_params
    params.require(:profile).permit(:user_username,:fname,:lname,:gender,:email,:address, :birthdate)
  end
  def set_profile
    @user=User.find_by(username: params[:user_username])#relationship has been established via id
    @profile=@user.profile
  end
end
