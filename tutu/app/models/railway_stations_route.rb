class RailwayStationsRoute < ApplicationRecord
  belongs_to :route
  belongs_to :railway_station

  default_scope { order(:position) }

  validates :railway_station_id, uniqueness: { scope: :route_id }
  validates :position, uniqueness: { scope: :route_id }
  validate :arrival_departure_times

  private

  def arrival_departure_times
    if arrival_time >= departure_time
      errors.add(:arrival_time, 'Must be less them departure')
    end
  end
end