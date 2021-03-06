class Admin::TrainsController < Admin::BaseController
  before_action :set_train, only: [:show, :edit, :update, :destroy, :update_name]

  def index
    @trains = Train.all
  end

  def show
  end

  def new
    @train = Train.new
  end

  def edit
  end

  def create
    @train = Train.new(train_params)

    if @train.save
      redirect_to [:admin, @train], notice: I18n.t('common.statuses.created',
                                                   resource: @train.localize)
    else
      render :new
    end
  end

  def update
    if @train.update(train_params)
      redirect_to [:admin, @train], notice: I18n.t('common.statuses.updated',
                                                   resource: @train.localize)
    else
      render :edit
    end
  end

  def destroy
    @train.destroy

    redirect_to admin_trains_url, notice: I18n.t('common.statuses.destroyed',
                                                 resource: @train.localize)
  end

  def update_name
    if @train.update(number: params[:number])
      redirect_to admin_trains_path, notice: I18n.t('common.statuses.updated',
                                                    resource: @train.localize)
    else
      redirect_to admin_trains_path, alert: I18n.t('common.statuses.rejected',
                                                   resource: @train.localize)
    end
  end

  private

  def set_train
    @train = Train.find(params[:id])
  end

  def train_params
    params.require(:train).permit(:number, :route_id, :railway_station_id,
                                  :inverse_wagons_order)
  end
end
