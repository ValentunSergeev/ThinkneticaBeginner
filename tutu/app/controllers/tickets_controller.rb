class TicketsController < ApplicationController

  before_action :set_train, only: [:create, :new]
  before_action :set_ticket, only: [:show, :destroy]

  def show
  end

  def new
    @ticket = @train.tickets.build
  end

  def create
    @ticket = @train.tickets.build(ticket_params)

    if @ticket.save
      redirect_to @ticket, notice: 'Ticket was successfully added.'
    else
      render :new
    end
  end

  def destroy
    @ticket.destroy
    redirect_to @train, notice: 'Train was successfully deleted.'
  end

  private

  def set_train
    @train = Train.find(params[:train_id])
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:start_station_id, :end_station_id,
                                   :full_name)
  end
end