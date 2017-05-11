class Train < ApplicationRecord
  belongs_to :route
  belongs_to :current_station, class_name: 'RailwayStation',
             foreign_key: :railway_station_id
  # has_many :tickets
  has_many :wagons, dependent: :destroy

  NUMBER_PATTERN = /\A[а-яa-z0-9]{3}-?[а-яa-z0-9]{2}\z/i

  validate :station_in_route?
  validates :number, format: NUMBER_PATTERN

  def wagons
    wagons = super
    inverse_wagons_order ? wagons.reverse : wagons
  end

  def wagon_seats(wagon_type, seats_type)
    wagons.select(type: wagon_type).sum("#{seats_type}_seats")
  end

  private

  def station_in_route?
    unless route.stations.include?(current_station)
      errors.add(:current_station, 'must be in selected route')
    end
  end
end
