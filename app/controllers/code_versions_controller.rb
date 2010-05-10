class CodeVersionsController < ApplicationController
  def new
    @code = Code.find(params[:code_id])
    @code_version = CodeVersion.new
    @code_version.source = @code.code_versions.first.source if @code.code_versions.first
  end
  
  def create
    @code_version = CodeVersion.new(params[:code_version])
    @code_version.code = Code.find(params[:code_id])
     if @code_version.save
        flash[:notice] = 'Code version was successfully created.'
        redirect_to(codes_path)
      else
        render :action => "new"
      end
  end
  
end
