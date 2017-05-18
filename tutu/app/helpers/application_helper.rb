module ApplicationHelper
  def action_for(resource)
    if resource.new_record?
      t('common.actions.create')
    else
      t('common.actions.update')
    end
  end

  def alert_for(flash_type)
    { success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message,
                         class: "alert #{alert_for(msg_type)} fade in") do
        concat content_tag(:button, '&times;'.html_safe,
                           class: 'close', data: { dismiss: 'alert' })
        concat message
      end)
    end
    nil
  end
end
