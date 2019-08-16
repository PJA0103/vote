class PlayersController < ApplicationController
    def index
        @players = Player.all        
    end

    def new
        @player = Player.new
    end

    def create

        @player = Player.new(simple)

        if @player.save
            flash[:notice] = "Player建置完成"
            redirect_to '/players'
        else
            render :new 
        end
    end

    def show
        params[:id]

        @player = Player.find_by(id: params[:id])
    end

    private
    def simple
        params.require(:player).permit(:name, :age, :reason)
    end
end