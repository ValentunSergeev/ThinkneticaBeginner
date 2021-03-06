class Route < ApplicationRecord

  has_many :railway_stations_routes
  has_many :stations, through: :railway_stations_routes, source: :railway_station

  has_many :trains

  validate :stations_length
  before_validation :set_name, if: -> { !name_changed? || name.nil?}

  def first_station
    stations.first
  end

  def last_station
    stations.last
  end

  private

  def stations_length
    if stations.size < 2
      errors.add(:base, I18n.t('errors.routes.size'))
    end
  end

  def set_name
    unless stations.empty?
      self.name = "#{first_station.title} - #{last_station.title}"
    end
  end
end