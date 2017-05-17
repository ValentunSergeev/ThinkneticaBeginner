class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def localize
    I18n.t(".activerecord.models.#{self.model_name.element.downcase}")
  end
end
