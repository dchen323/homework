class AlbumsController < ApplicationController

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def new
    @album = Album.new
    @band = Band.find(params[:band_id])
    render :new
  end

  def create
    @album = Album.new(album_params)
    @album.band_id = params[:band_id]
    if @album.save
      redirect_to album_url(@album)
    else
      redirect_to new_band_album_url
    end
  end

  private

  def album_params
    params.require(:album).permit(:band_id, :title,:year,:recording_type)
  end
end
