class EconomyWagon < Wagon
  validates :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats,
            numericality: { greater_than: 0, only_integer: true }
  validates :sitting_seats, presence: false
end