class Ticket < ApplicationRecord
  belongs_to :train
  belongs_to :user

  def start_station
    train.route.first_station
  end

  def end_station
    train.route.last_station
  end
end
