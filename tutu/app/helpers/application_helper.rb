module ApplicationHelper
  def action_for(resource)
    if resource.new_record?
      t('common.actions.create')
    else
      t('common.actions.update')
    end
  end
end
