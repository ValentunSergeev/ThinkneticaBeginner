class Ticket < ApplicationRecord
  belongs_to :train
  belongs_to :user

  belongs_to :start_station, class_name: 'RailwayStation'
  belongs_to :end_station, class_name: 'RailwayStation'

  validate :validate_stations
  validates :full_name, presence: true
  
  after_create :send_buy_email
  before_destroy :send_delete_email

  def name
    "#{start_station.title}-#{end_station.title}"
  end

  private

  def send_buy_email
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end

  def send_delete_email
    TicketsMailer.delete_ticket(self.user, self).deliver_now
  end

  def validate_stations
    if start_station.id == end_station.id
      errors.add(:end_station, I18n.t('errors.stations.equal'))
    end
    stations_in_route = train.route.stations
    unless stations_in_route.include?(start_station)
      errors.add(:start_station, I18n.t('errors.stations.in_route'))
    end
    unless stations_in_route.include?(end_station)
      errors.add(:end_station, I18n.t('errors.stations.in_route'))
    end
  end


end
