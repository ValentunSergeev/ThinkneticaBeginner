class Train < ApplicationRecord
  belongs_to :route
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :railway_station_id
  # has_many :tickets
  has_many :wagons, dependent: :destroy

  NUMBER_PATTERN = /\A[а-яa-z0-9]{3}-?[а-яa-z0-9]{2}\z/i

  validate :station_in_route?
  validates :number, format: NUMBER_PATTERN


  def wagon_seats(kind, seats_type)
    wagons_by_type(kind).sum("#{seats_type}_seats")
  end

  def wagons_count(kind)
    wagons_by_type(kind).size
  end

  private

  def station_in_route?
    errors.add(:current_station, 'must be in selected route') unless route.stations.include?(current_station)
  end

  def wagons_by_type(kind)
    Wagon.where(kind: kind, train_id: self.id)
  end
end
