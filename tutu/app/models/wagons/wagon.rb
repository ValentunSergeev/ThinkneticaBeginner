class Wagon < ApplicationRecord

  TYPES = {
  CoupeWagon:   'coupe',
  EconomyWagon: 'economy',
  PremiumWagon: 'premium',
  SittingWagon: 'sitting'
  }

  SEATS_TYPES = %w(top bottom side_bottom side_top sitting)

  belongs_to :train

  default_scope { order(:number) }

  scope :typed, ->(type) { where(type: type) }

  validates :number, uniqueness: { scope: :train_id }

  before_validation :set_number

  def generalize
    self.becomes(Wagon)
  end

  def exist_seats
    hashify_seats.delete_if { |key, value| value.zero? }
  end

  private

  def set_number
    self.number ||= next_number
  end

  def next_number
    wagons = Wagon.where(train_id: train_id)
    wagons.empty? ? 1 : wagons.last.number + 1
  end

  def hashify_seats
    result   = {}
    SEATS_TYPES.each do |e|
      result[e.sub('_', ' ')] = send("#{e}_seats")
    end
    result
  end
end
