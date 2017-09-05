class Api::ArtistsController < ApplicationController
before_action :authenticate_user!


    def index
        @artists = Artist.all
        render json: @artists
    end

    def create
        @artist = Artist.new(artist_params)
        if @artist.save
            render json: @artist
        else
            render json: {
                message: 'error createing artist'
            }
    end
end

def show
    @artist = Artist.find(params[:id])
    @songs = @artist.songs.all
    render json: {
      artist: @artist,
      songs: @songs
    }
  end
    
    def update
        @artist = Artist.find(params[:id])
       if @artist.update!(artist_params)
       else
        render json: {
            message: 'error createing artist'
        }
    end
end
    
    def destroy
        @artist = Artist.find(params[:id])
        @artist.destroy
        render json:{
            message: 'artist successfully destroyed'
        }
    end
    
    private
    
    def artist_params
        params.require(:artist).permit(:name, :photo_url, :nationality)
    end
end


