class Admin::RoutesController < Admin::BaseController
  before_action :set_route, only: [:show, :edit, :update, :destroy, :update_name]

  def index
    @routes = Route.all
  end

  def show
  end

  def new
    @route = Route.new
  end

  def create
    @route = Route.new(route_params)

    if @route.save
      redirect_to [:admin, @route],
                  notice: I18n.t('common.statuses.created',
                                 resource: @route.localize)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @route.update(route_params)
      redirect_to [:admin, @route],
                  notice: I18n.t('common.statuses.updated',
                                 resource: @route.localize)
    else
      render :edit
    end
  end

  def destroy
    @route.destroy
    redirect_to admin_routes_path,
                notice: I18n.t('common.statuses.destroyed',
                               resource: @route.localize)
  end

  def update_name
    if @route.update(name: params[:name])
      redirect_to admin_routes_path, notice: I18n.t('common.statuses.updated',
                                                    resource: @route.localize)
    else
      redirect_to admin_routes_path, alert: I18n.t('common.statuses.rejected',
                                                    resource: @route.localize)
    end
  end

  private

  def route_params
    params.require(:route).permit(station_ids: [])
  end

  def set_route
    @route = Route.find(params[:id])
  end
end