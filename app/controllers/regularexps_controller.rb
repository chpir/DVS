class RegularexpsController < ApplicationController
  def index
    @regularexps = Regularexp.all
  end
  
  def show
    @regularexp = Regularexp.find(params[:id])
  end
  
  def new
    @regularexp = Regularexp.new
  end
  
  def create
    @regularexp = Regularexp.new(params[:regularexp])
    if @regularexp.save
      flash[:notice] = "Successfully created regularexp."
      redirect_to @regularexp
    else
      render :action => 'new'
    end
  end
  
  def edit
    @regularexp = Regularexp.find(params[:id])
  end
  
  def update
    @regularexp = Regularexp.find(params[:id])
    if @regularexp.update_attributes(params[:regularexp])
      flash[:notice] = "Successfully updated regularexp."
      redirect_to @regularexp
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @regularexp = Regularexp.find(params[:id])
    @regularexp.destroy
    flash[:notice] = "Successfully destroyed regularexp."
    redirect_to regularexps_url
  end
end
