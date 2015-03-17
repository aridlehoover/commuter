class StationsController < ApplicationController
  def index
    @stations = Station.all
    render nothing: true, status: :not_found and return unless @stations
    render json: @stations, status: :ok
  end

  def show
    @station = StationSerializer.new(Station.find params[:id]).as_json
    render status: not_found and return unless @station
    render json: @station, status: :ok
  end
end
