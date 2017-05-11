class CoupeWagon < Wagon
  validates :top_seats, :bottom_seats,
            numericality: { greater_than: 0, only_integer: true }
  validates :side_bottom_seats, :side_top_seats, :sitting_seats,
            presence: false
end