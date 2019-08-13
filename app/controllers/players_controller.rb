class PlayersController < ApplicationController
    def index        
    end

    def new
        @player = Player.new
    end

    def create
        @player = Player.new(params[:player])

        if @plyaer.save
            redirect_to '/players'
        else
        end
    end
end