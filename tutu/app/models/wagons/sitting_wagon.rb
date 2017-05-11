class SittingWagon < Wagon
  validates :sitting_seats, numericality: { greater_than: 0, only_integer: true }
  validates :top_seats, :side_bottom_seats, :side_top_seats, :bottom_seats,
            presence: false
end