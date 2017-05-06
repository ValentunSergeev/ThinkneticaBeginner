class RailwayStation < ApplicationRecord
  has_and_belongs_to_many :routes

  validates :title, presence: true
end
