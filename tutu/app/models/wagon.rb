class Wagon < ApplicationRecord
  belongs_to :train

  validates :top_seats, :bottom_seats, numericality: { greater_than: 0, only_integer: true }

  enum kind: [:economy, :coupe]
end
