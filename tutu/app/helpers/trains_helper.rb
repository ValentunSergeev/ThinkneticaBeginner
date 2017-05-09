module TrainsHelper
  def build_wagons_info(train, wagons_kind)
    "#{wagons_kind}: #{train.wagons_count(wagons_kind)},
          bottom seats: #{train.wagon_seats(wagons_kind, :bottom)},
          top seats: #{train.wagon_seats(wagons_kind, :top)}"
  end
end
