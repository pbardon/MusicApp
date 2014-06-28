class AlbumsController < ApplicationController
  def index
    @albums = Band.find_by_id(params[:band_id]).albums
    render 'index'
  end

  def show
    @album = Album.find_by_id(params[:id])
    render 'show'
  end

  def new
    @album = Album.new
    render 'new'
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = "Could not create album"
      render 'new'
    end
  end

  def edit
    @album = Album.find_by_id(params[:id])
    render 'edit'
  end

  def update
    @album = Album.find_by_id(params[:id])
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = "Could not update album information"
      render 'edit'
    end
  end

  def destroy
    @album = Album.find_by_id(params[:id])
    if @album.destroy!
      redirect_to band_albums_url
    else
      flash.now[:errors] = "Could not delete album"
      render 'show'
    end
  end

  private

  def album_params
    params.require(:album).permit(:album_name, :band_id, :live )
  end
end
