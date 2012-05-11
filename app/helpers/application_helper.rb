module ApplicationHelper
  def title(controller_name)
    string = 'VPS MANAGE - ' + t("activerecord.models.#{controller_name.singularize}") + t("title.#{controller.action_name}")
    string.html_safe
  end
end
