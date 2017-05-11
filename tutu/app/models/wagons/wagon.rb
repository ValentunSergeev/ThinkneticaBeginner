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

  private

  def set_number
    self.number ||= next_number
  end

  def next_number
    wagons = Wagon.where(train_id: train_id)
    wagons.empty? ? 1 : wagons.last.number + 1
  end
end
