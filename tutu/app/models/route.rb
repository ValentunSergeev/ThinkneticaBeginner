class Route < ApplicationRecord

  has_and_belongs_to_many :stations, class_name: 'RailwayStation'

  has_many :trains

  validates :name, presence: true

  def first_station
    stations.first
  end

  def last_station
    stations.last
  end
end