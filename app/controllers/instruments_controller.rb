class InstrumentsController < ApplicationController
  def index
    @instruments = Instrument.all(:include => [:round])
  end
  
  def show
    @instrument = Instrument.find(params[:id], :include => [:round])
  end
  
  def new
    @instrument = Instrument.new
    @rounds = Round.all
  end
  
  def create
    @instrument = Instrument.new(params[:instrument])
    if @instrument.save
      flash[:notice] = "Successfully created instrument."
      redirect_to @instrument
    else
      render :action => 'new'
    end
  end
  
  def edit
    @instrument = Instrument.find(params[:id])
    @rounds = Round.all
  end
  
  def update
    @instrument = Instrument.find(params[:id])
    if @instrument.update_attributes(params[:instrument])
      flash[:notice] = "Successfully updated instrument."
      redirect_to @instrument
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @instrument = Instrument.find(params[:id])
    @instrument.destroy
    flash[:notice] = "Successfully destroyed instrument."
    redirect_to instruments_url
  end
end
