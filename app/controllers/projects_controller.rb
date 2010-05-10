class ProjectsController < ApplicationController
  active_scaffold :project do |config|
    config.columns = [:name, :description]
  end
  
  def change
    if request.post?
      p = Project.find(params[:project_id]) || Project.first
      session[:project_id] = p.id
      flash[:notice] = "Project changed to #{p.name}"
      redirect_to params[:redir]
    else
      @projects = Project.all(:order => 'name')
    end
  end
end
