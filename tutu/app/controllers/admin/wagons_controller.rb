class Admin::WagonsController < Admin::BaseController

  before_action :set_train, only: [:create, :new]
  before_action :set_wagon, only: [:show, :destroy, :edit]

  def index
    @wagons = Wagon.order(:train_id, :number)
  end

  def show
  end

  def new
    @wagon = @train.wagons.build
  end

  def create
    @wagon = @train.wagons.build(wagon_params)

    if @wagon.save
      redirect_to admin_train_path(@train),
                  notice: 'Wagon was successfully added.'
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    train = @wagon.train
    @wagon.destroy
    redirect_to [:admin, train], notice: 'Train was successfully deleted.'
  end

  private

  def set_train
    @train = Train.find(params[:train_id])
  end

  def set_wagon
    @wagon = Wagon.find(params[:id])
  end

  def wagon_params
    params.require(:wagon).permit(:top_seats, :bottom_seats, :sitting_seats,
                                  :side_top_seats, :side_bottom_seats, :type)
  end
end