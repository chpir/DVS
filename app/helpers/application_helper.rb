# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def title(t)
    @page_title_for_templating = t
  end
  
  def jquery(t)
    @jquery = t
  end
  
  def javascript_head(t)
    @javascript = t
  end

  def javascript(t)
    @javascript = t
  end

  
  # TODO duplicated in application controller
  def get_project
    if session[:project_id]
      Project.find(session[:project_id])
    else
      Project.first
    end
  end

  
end
