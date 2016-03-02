class ProfilesController < ApplicationController
  include AuthsHelper
  layout 'application'
  before_action :authenticate_user#, :except=>[]
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
         format.html {redirect_to profile_path(current_user.email)}
       else
         format.html{render 'new'}
       end
     end
  end
  def show
     @user=User.find(session[:user_id])
    @profile=@user.profile
  end

  def edit
    @user=User.find(session[:user_id])
    @profile=user.profile
  end

  def update
  end

  def destroy
  end
  private
  def profile_params
    params.require(:profile).permit :user_id,:fname,:lname,:gender,:address, :birthdate
  end

end
