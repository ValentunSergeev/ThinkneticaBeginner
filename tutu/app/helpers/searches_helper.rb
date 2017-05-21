module SearchesHelper
  def search_area_classes
    if @trains != nil
      'col-md-4 col-sm-12 col-lg-3'
    else
      'col-lg-6 col-lg-offset-3 col-md-8 col-md-offset-2'
    end
  end
end