module SearchesHelper
  def search_area_classes
    if @trains != nil
      'col-md-4 col-sm-12 col-lg-3'
    else
      'col-lg-6 col-lg-offset-3 col-md-8 col-md-offset-2'
    end
  end

  def query_params
    result = {}
    result[:start_station_id] = params[:start_station_id] || @start_station_id
    result[:end_station_id] = params[:end_station_id] || @end_station_id
    result[:anchor] = "train-#{params[:train_id]}"
    result
  end
end