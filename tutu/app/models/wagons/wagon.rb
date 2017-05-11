class Wagon < ApplicationRecord
  belongs_to :train

  TYPES = {
      CoupeWagon:   'coupe',
      EconomyWagon: 'economy',
      PremiumWagon: 'premium',
      SittingWagon: 'sitting'
  }
end
