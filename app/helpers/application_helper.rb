module ApplicationHelper
  def error_messages_for(object)
    render(:partial => 'application/error_messages', :locals => {:object => object})
  end
  def status_tag(boolean, options={})
    options[:true_text] ||= ''
    options[:false_text] ||= ''

    if boolean
      content_tag(:div, options[:true_text], :class => 'check_status-icon')
    else
      content_tag(:div, options[:false_text], :class => 'uncheck_status-icon')
    end
  end
end
