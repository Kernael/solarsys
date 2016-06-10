class PlanetsController < ApplicationController
  before_action :set_planet, only: %i(show destroy)

  def index
    planets = if planet_filter == 'giant'
                Planet.giant
              elsif planet_filter == 'terrestrial'
                Planet.terrestrial
              else
                Planet.all
              end

    @planets = planets.order('planets.name ' + sort_direction)
  end

  def show
  end

  def new
    @planet = Planet.new
  end

  def create
    @planet = Planet.new(planet_params)

    respond_to do |format|
      if @planet.save
        format.html { redirect_to planets_url }
        format.json { render :show, status: :created, location: @planet }
      else
        format.html { render :new }
        format.json { render json: @planet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @planet.destroy

    respond_to do |format|
      format.html { redirect_to planets_url }
      format.json { head :no_content }
    end
  end

  private

  def set_planet
    @planet = Planet.find(params[:id])
  end

  def planet_params
    params.require(:planet).permit(:name, :planet_type, :star_id)
  end

  def sort_direction
    %w(ASC DESC).include?(params[:direction]) ? params[:direction] : 'ASC'
  end

  def planet_filter
    params[:filter]
  end
end
