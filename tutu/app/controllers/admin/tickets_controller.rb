class Admin::TicketsController < Admin::BaseController

  before_action :set_ticket, only: [:show, :destroy, :edit, :update]

  def index
    @tickets = Ticket.order(:train_id, :user_id)
  end

  def show
  end

  def new
    @ticket = Ticket.new
    @stations = RailwayStation.all
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      redirect_to [:admin, @ticket], notice: I18n.t('common.statuses.created',
                                                    resource: @ticket.localize)
    else
      render :new
    end
  end

  def edit
    @stations = RailwayStation.all
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to [:admin, @ticket], notice: I18n.t('common.statuses.updated',
                                                    resource: @ticket.localize)
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to admin_tickets_path, notice: I18n.t('common.statuses.destroyed',
                                                   resource: @ticket.localize)
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:start_station_id, :end_station_id,
                                   :full_name, :user_id, :train_id)
  end
end