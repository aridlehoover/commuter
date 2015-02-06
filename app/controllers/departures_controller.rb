class DeparturesController < ApplicationController
  def show
    @departures = DepartureSerializer.new(Departure.find params[:id]).as_json
    redirect_to stations_path, {flash: {error: "Station '#{params[:id]}' not found"}} unless @departures
  end
end
