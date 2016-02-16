class TournamentsController < ApplicationController
  def index
  end

  def list
  	tournaments = Tournament.all
    render json: tournaments
  end

  def create
  	tournament = Tournament.create(tournament_params)
  	render json: tournament
  end

  def delete
  	id = params[:id]
  	tournament = Tournament.find_by(id: id)
  	tournament.destroy

  	render json: tournament
  end

  def add_player
    tournament = Tournament.find_by(id: params[:tournament_id])
    player = Player.find_by(id: params[:id])

    tournament.players.push(player)
    render json: tournament.to_json({:include => :players})
  end

  private

  def tournament_params
  	params.require(:tournament).permit(:name)
  end
end
