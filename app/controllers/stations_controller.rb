class StationsController < ApplicationController
  def index
    @stations = Station.all
  end

  def show
    @station = Station.find params[:id]
    redirect_to stations_path unless @station
    # need flash message re: station not found
  end
end
