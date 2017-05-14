class Ticket < ApplicationRecord
  belongs_to :train
  # belongs_to :user

  belongs_to :start_station, class_name: 'RailwayStation'
  belongs_to :end_station, class_name: 'RailwayStation'

  validate :validate_stations
  validates :full_name, presence: true

  private

  def validate_stations
    if start_station.id == end_station.id
      errors.add(:end_station, 'must not be equal to the start station.')
    end
  end
end
