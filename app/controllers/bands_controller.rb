class BandsController < ApplicationController

  def index
    @bands = Band.all
    render 'index'
  end

  def show
    @band = Band.find_by_id(params[:id])
    render 'show'
  end

  def new
    @band = Band.new
    render 'new'
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      flash.now[:errors] = "Could not create band"
      render 'new'
    end
  end

  def edit
    @band = Band.find_by_id(params[:id])
    render 'edit'
  end

  def update
    @band = Band.find_by_id(params[:id])
    if @band.save
      redirect_to band_url(@band)
    else
      flash.now[:errors] = "Could not update band information"
      render 'edit'
    end
  end

  def destroy
    @band = Band.find_by_id(params[:id])
    if @band.destroy!
      redirect_to bands_url
    else
      flash.now[:errors] = "Could not delete band"
      render 'show'
    end
  end

  private

  def band_params
    params.require(:band).permit(:band_name)
  end
end
