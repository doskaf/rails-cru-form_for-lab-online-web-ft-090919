class SongsController < ApplicationController

    def index
        @songs = Song.all
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.create(song_params(:name, :artist_id, :genre_id))

        redirect_to song_path(@song)
    end

    def edit
        @song = Song.find_by_id(params[:id])
    end

    def update
        @song = Song.find_by_id(params[:id])
        @song.update(song_params(:name, :artist_id, :genre_id))

        redirect_to song_path(@song)
    end

    def show
        @song = Song.find_by_id(params[:id])
        @artist = Artist.find_by_id(@song.artist_id)
        @genre = Genre.find_by_id(@song.genre_id)
    end

    private

    def song_params(*args)
        params.require(:song).permit(*args)
    end

end