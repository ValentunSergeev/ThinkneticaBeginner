module SearchesHelper
  def search_area_classes
    if @trains != nil
      'col-md-4 col-sm-12 col-lg-3'
    else
      'col-lg-12'
    end
  end
end