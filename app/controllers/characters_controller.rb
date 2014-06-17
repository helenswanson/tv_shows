class CharactersController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @show = TelevisionShow.find(params[:television_show_id])
    @character = Character.new(character_params)

    @character.television_show_id = @show.id
    if @character.save
      flash[:notice] = "Success!"
    else
      flash.now[:notice] = "Your character couldn't be saved."
    end
    redirect_to "/television_shows/#{@show.id}"
  end

  private

  def character_params
    params.require(:character).permit(:character_name, :actor_name, :description)
  end

end
