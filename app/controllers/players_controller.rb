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

    def edit
        @player = Player.find_by(id: params[:id])
    end

    def update
        @player = Player.find_by(id: params[:id])
        
        if @player.update(simple)
            flash[:notice] = "Player修改完成"
            redirect_to '/players'
        else
            render :edit
        end
    end

    def destroy
        @player = Player.find_by(id: params[:id])

        @player.destroy
            flash[:notice] = "Player刪除"
            redirect_to '/players'


    end

    def vote
        @player = Player.find_by(id: params[:id])
        @player.votes = @player.votes + 1
        @player.save

        flash[:notice] = "完成投票"
        redirect_to '/players'

    end

    private
    def simple
        params.require(:player).permit(:name, :age, :reason)
    end
end