class Api::SongsController < ApplicationController
    
    def index
        @artist = Artists.find(params[:id])
        @songs = @artist.Song.all
        render json: @songs
    end

    def create
        @song = Song.new(song_params)
        if @song.save
            render json: @song
        else
            render json: {
                message: 'error createing song'
            }
        end
    end

    def show
        @song = Song.find(params[:id])
        render json: @song
    end

    def update
        @song = Song.find(params[:id])
        if @song.update!(song_params)
        else
         render json: {
             message: 'error createing artist'
         }
     end
 end

    def destroy
        @song = Song.find(params[:id])
        @song.destroy
        render json:{
            message: 'song successfully destroyed'
        }
    end

    private
    
    def song_params
        params.require(:song).permit(:title, :preview_url, :album)
    end

end
