class TracksController < ApplicationController

  def index
    @tracks = Track.all
    render 'index'
  end

  def show
    @track = Track.find_by_id(params[:id])
    render 'show'
  end

  def new
    @track = Track.new
    render 'new'
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to album_url(@track)
    else
      flash.now[:errors] = "Could not create album"
      render 'new'
    end
  end

  def edit
    @track = Track.find_by_id(params[:id])
    render 'edit'
  end

  def update
    @track = Track.find_by_id(params[:id])
    if @track.save
      redirect_to album_url(@track)
    else
      flash.now[:errors] = "Could not update album information"
      render 'edit'
    end
  end

  def destroy
    @track = Track.find_by_id(params[:id])
    if @track.destroy!
      redirect_to tracks_url
    else
      flash.now[:errors] = "Could not delete album"
      render 'show'
    end
  end

  private

  def track_params
    params.require(:track).permit(:track_name, :album_id)
  end
end
