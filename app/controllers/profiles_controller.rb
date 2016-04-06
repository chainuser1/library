class ProfilesController < ApplicationController
  layout 'application'
  before_action :authenticate_user#, :except=>[]
  before_action :set_profile,:only=>[:change,:new,:update,:manifest,:remove]
  def index
  end
  def new
    if !@profile.nil?
      redirect_to manifest_profile_path(current_user.username)
    else
      @profile=Profile.new
    end
  end
  def create
       @profile=current_user.create_profile(profile_params)
       respond_to do |format|
         if @profile.save
           format.html {redirect_to manifest_profile_path(current_user.username)}
           format.json {render :manifest, status: :created, location: @profile}
         else
           format.html{render 'new'}
           format.json { render json: @profile.errors, status: :unprocessable_entity }
         end
       end
  end
  def manifest
    if profile_checker?
      render 'show'
    else
      redirect_to new_profile_path
    end
  end

  def change
    render 'edit'
  end
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html {redirect_to manifest_profile_path}
        format.json {render :manifest, status: :created, location: @profile}
      else
        render 'edit'
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end
 def delete

 end
  def remove
    @profile.delete
    redirect_to logout_auths_path
  end
  private


  def profile_params
    params.require(:profile).permit(:user_username,:fname,:lname,:gender,:email,:address, :birthdate)
  end
  def set_profile
    @profile=current_user.profile
  end
end
