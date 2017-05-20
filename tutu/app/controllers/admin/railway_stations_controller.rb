class Admin::RailwayStationsController < Admin::BaseController
  before_action :set_railway_station, only: [:show, :edit, :update, :destroy,
                                             :update_route_params]

  def index
    @railway_stations = RailwayStation.all
  end

  def show
  end

  def new
    @railway_station = RailwayStation.new
  end

  def edit
  end

  def create
    @railway_station = RailwayStation.new(railway_station_params)

    if @railway_station.save
      redirect_to [:admin, @railway_station],
                  notice: I18n.t('admin.railway_stations.created')
    else
      render :new
    end
  end

  def update
    if @railway_station.update(railway_station_params)
      redirect_to [:admin, @railway_station],
                  notice: I18n.t('admin.railway_stations.updated')
    else
      render :edit
    end
  end

  def destroy
    @railway_station.destroy

    redirect_to admin_railway_stations_url,
                notice: I18n.t('admin.railway_stations.destroyed')
  end

  def update_route_params
    @route = Route.find(params[:route_id])
    if @railway_station.update_route_params(@route, station_route_params)
      redirect_to [:admin, @route],
                  notice: I18n.t('admin.railway_stations.params_updated')
    else
      redirect_to [:admin, @route], alert: I18n.t('common.statuses.rejected')
    end
  end

  private

  def set_railway_station
    @railway_station = RailwayStation.find(params[:id])
  end

  def railway_station_params
    params.require(:railway_station).permit(:title)
  end

  def station_route_params
    params.permit(:position, :arrival_time, :departure_time)
  end
end
