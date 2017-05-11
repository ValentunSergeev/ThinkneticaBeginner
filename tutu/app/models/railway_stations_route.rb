class RailwayStationsRoute < ApplicationRecord
  belongs_to :route
  belongs_to :railway_station

  default_scope { order(:position) }

  validates :position, numericality: { greater_than: 0, only_integer: true },
            uniqueness:              { scope: :route_id }, unless: -> { new_record? }

  validates :railway_station_id, uniqueness: { scope: :route_id }
end