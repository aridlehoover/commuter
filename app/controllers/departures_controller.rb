class DeparturesController < ApplicationController
  def show
    @station = Departure.find params[:id]
    redirect_to stations_path, {flash: {error: "Station '#{params[:id]}' not found"}} unless @station
  end
end
