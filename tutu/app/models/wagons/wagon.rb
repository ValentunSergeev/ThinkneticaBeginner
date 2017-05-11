class Wagon < ApplicationRecord
  default_scope { order(:number) }

  TYPES = {
      CoupeWagon:   'coupe',
      EconomyWagon: 'economy',
      PremiumWagon: 'premium',
      SittingWagon: 'sitting'
  }

  belongs_to :train

  validates :number, uniqueness: { scope: :train_id }

  before_validation :set_number

  def generalize
    self.becomes(Wagon)
  end

  def exist_seats
    hashify_seats.delete_if { |key, value| value.nil? }
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
    prefixes = [:top, :bottom, :side_bottom, :side_top, :sitting]
    result   = {}
    prefixes.each do |e|
      result[e] = send("#{e}_seats".to_sym)
    end
    result
  end
end
