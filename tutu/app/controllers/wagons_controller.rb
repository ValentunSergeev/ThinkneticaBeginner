class WagonsController < ApplicationController

  before_action :set_train

  def new
    @wagon = @train.wagons.build
  end

  def create
    @wagon = @train.wagons.build(wagon_params)

    if @wagon.save
      redirect_to train_path(@train), notice: 'Wagon was successfully added.'
    else
      render :new
    end
  end


  private

  def set_train
    @train = Train.find(params[:train_id])
  end

  def wagon_params
    params.require(:wagon).permit(:top_seats, :bottom_seats, :sitting_seats,
                                  :side_top_seats, :side_bottom_seats, :type)
  end
end