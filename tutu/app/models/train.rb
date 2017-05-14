class Train < ApplicationRecord
  belongs_to :route
  belongs_to :current_station, class_name: 'RailwayStation',
             foreign_key: :railway_station_id
  has_many :tickets
  has_many :wagons, dependent: :destroy

  NUMBER_PATTERN = /\A[а-яa-z0-9]{3}-?[а-яa-z0-9]{2}\z/i

  validate :station_in_route?
  validates :number, format: NUMBER_PATTERN

  def self.search(params={})
    return nil if params.compact.empty?
    routes = Route.select do |route|
      start_st = route.stations.detect {|st| st.id == params[:start_station_id].to_i }
      end_st = route.stations.detect {|st| st.id == params[:end_station_id].to_i}

      start_st && end_st && start_st.position_in(route) < end_st.position_in(route)
    end
    Train.where(route: routes).uniq
  end


  def wagons
    wagons = super
    inverse_wagons_order ? wagons.reverse : wagons
  end

  def wagon_seats(wagon_type, seats_type)
    wagons.select(type: wagon_type).sum("#{seats_type}_seats")
  end

  def time_for(station_id)
    station_route = route.railway_stations_routes
                        .find_by(railway_station_id: station_id)
    { arrival: station_route.arrival_time.to_s(:time),
      departure: station_route.departure_time.to_s(:time) }
  end

  private

  def station_in_route?
    unless route.stations.include?(current_station)
      errors.add(:current_station, 'must be in selected route')
    end
  end
end
