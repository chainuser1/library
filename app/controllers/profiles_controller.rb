class ProfilesController < ApplicationController
  include AuthsHelper
  layout 'application'
  before_action :authenticate_user#, :except=>[]
  before_action :set_profile,:only=>[:show,:edit,:update,:destroy]
  def new
    if profile_checker?
      redirect_to profile_path(current_user.email)
    else
      @profile=Profile.new
    end
  end

  def create
     @profile=Profile.new(profile_params)
     respond_to do |format|
       if @profile.save
         set_profile
         format.html {redirect_to profile_path(current_user.email)}
       else
         format.html{render 'new'}
       end
     end
  end
  def show
  end
  def update
  end
  def edit

  end
  def destroy
    begin
      @profile.delete
      redirect_to logout_auths_path
    rescue Exception => e
      redirect_to new_profile_path
    end
  end
  private
  def profile_params
    params.require(:profile).permit(:user_email,:fname,:lname,:gender,:address, :birthdate)
  end
  def set_profile
    @user=User.find_by(email: current_user.email)#relationship has been established via id
    @profile=@user.profile
  end
end
