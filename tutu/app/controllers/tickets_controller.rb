class TicketsController < ApplicationController
  before_action :authenticate_user!, except: [:new]
  before_action :set_ticket, only: [:show, :destroy]
  before_action :require_owner, only: [:show, :destroy]
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
      redirect_to @ticket, notice: I18n.t('common.statuses.created',
                                          resource: @ticket.localize)
    else
      save_stations
      render :new
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path, notice: I18n.t('common.statuses.destroyed',
                                             resource: @ticket.localize)
  end

  private

  def save_stations
    @start_station_id = @ticket.start_station_id
    @end_station_id = @ticket.end_station_id
  end

  def set_train
    @train = Train.find(params[:train_id])
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    result = params.require(:ticket).permit(:start_station_id, :end_station_id,
                                   :full_name)
    result[:start_station_id] ||= @start_station_id
    result[:end_station_id] ||= @end_station_id
    result
  end

  def require_owner
    unless @ticket.user == current_user
      redirect_to root_path, alert: t('common.statuses.forbidden')
    end
  end
end