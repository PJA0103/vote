class PlayersController < ApplicationController

    before_action :player_id, only: [:show, :edit, :update, :destroy, :vote]

    def index
        @players = Player.all        
    end

    def new
        @player = Player.new
    end

    def create

        @player = Player.new(simple)

        if @player.save
            redirect_to '/players' , notice: "Player建置完成"
        else
            render :new 
        end
    end

    def show
    end

    def edit
    end    
    def update
        
        if @player.update(simple)
            
            redirect_to '/players' , notice: "Player修改完成"
        else
            render :edit
        end
    end

    def destroy
        
        @player.destroy
            redirect_to '/players' , notice: "Player刪除"
        

    end

    def vote

        Voterecord.create(player: @player, ip_address: request.remote_ip )
  

        flash[:notice] = "完成投票"
        redirect_to '/players'

    end

    private
    def simple
        params.require(:player).permit(:name, :age, :reason)
    end

    def player_id
        @player = Player.find_by(id: params[:id])
    end

end