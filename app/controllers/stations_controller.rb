class StationsController < ApplicationController
  def index
    @stations = Station.all
  end

  def show
    @station = StationSerializer.new(Station.find params[:id]).as_json
    redirect_to stations_path, {flash: {error: "Station '#{params[:id]}' not found"}} unless @station
  end
end
