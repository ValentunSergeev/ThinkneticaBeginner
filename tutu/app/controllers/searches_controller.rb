class SearchesController < ApplicationController
  def show
    @stations  = RailwayStation.all
    @trains = Train.search(search_params)
  end

  def search_params
    params.permit(:start_station_id, :end_station_id)
  end
end