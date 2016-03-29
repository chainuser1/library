class PhotosController < ApplicationController
  def index
    @photos=current_user.photos.all
  end
  def new
    @photo=Photo.new
  end
  def create
    @photo=Photo.new(photo_params)
    if @photo.save
      redirect_to photos_path, notice: "The #{@photo.name} has been uploaded"
    else
      render 'new'
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
