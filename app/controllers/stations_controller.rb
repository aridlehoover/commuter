class StationsController < ApplicationController
  def index
    @stations = Station.all
    render nothing: true, status: :not_found unless @stations
    render json: @stations, status: :ok
  end

  def show
    @station = StationSerializer.new(Station.find params[:id]).as_json
    redirect_to stations_path, {flash: {error: "Station '#{params[:id]}' not found"}} unless @station
  end
end
