class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show]
  before_action :require_owner, only: [:show]
  before_action :set_train, only: [:create, :new]

  def index
    @tickets = current_user.tickets.order(:train_id)
  end

  def show
  end

  def new
    @ticket = @train.tickets.build
  end

  def create
    @ticket = @train.tickets.build(ticket_params)
    @ticket.user = current_user

    if @ticket.save
      redirect_to @ticket, notice: 'Ticket was successfully added.'
    else
      render :new
    end
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

  def require_owner
    unless @ticket.user == current_user
      redirect_to root_path, alert: 'You have no rights to see this page.'
    end
  end
end