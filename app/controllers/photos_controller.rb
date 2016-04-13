class PhotosController < ApplicationController
  def index
    @photos=current_user.photos.paginate(:per_page=>20,:page=>params[:photos] )
  end
  def new
    @photo=Photo.new
  end
  def create
    @photo=Photo.new(photo_params)
    respond_to do |format|
      if @photo.save
        format.html {redirect_to photos_path, notice: "The #{@photo.name} has been uploaded"}
      else
        format.html{render 'new'}
        format.js {}
      end
    end
  end
  def destroy
    @photo=Photo.find(param[:id])
    @photo.destroy
    redirect_to photos_path, notice: "The photo #{@photo.name} has been deleted"
  end
  private
  def photo_params
    params.require(:photo).permit(:user_username,:name,:attachment)
  end
end
