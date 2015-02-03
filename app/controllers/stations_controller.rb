class StationsController < ApplicationController
  def index
    @stations = Station.all
  end

  def show
    @station = Station.find params[:id]
    redirect_to stations_path, {flash: {error: "Station '#{params[:id]}' not found"}} unless @station
  end
end
