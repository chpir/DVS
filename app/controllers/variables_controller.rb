class VariablesController < ApplicationController
  # GET /variables
  # GET /variables.xml
  def index
    @variables = Variable.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @variables }
    end
  end

  # GET /variables/1
  # GET /variables/1.xml
  def show
    @variable = Variable.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @variable }
    end
  end

  # GET /variables/new
  # GET /variables/new.xml
  def new
    @variable = Variable.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @variable }
    end
  end

  # GET /variables/1/edit
  def edit
    @variable = Variable.find(params[:id])
  end

  # POST /variables
  # POST /variables.xml
  def create
    @variable = Variable.new(params[:variable])

    respond_to do |format|
      if @variable.save
        flash[:notice] = 'Variable was successfully created.'
        format.html { redirect_to(@variable) }
        format.xml  { render :xml => @variable, :status => :created, :location => @variable }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @variable.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /variables/1
  # PUT /variables/1.xml
  def update
    @variable = Variable.find(params[:id])

    respond_to do |format|
      if @variable.update_attributes(params[:variable])
        flash[:notice] = 'Variable was successfully updated.'
        format.html { redirect_to(@variable) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @variable.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /variables/1
  # DELETE /variables/1.xml
  def destroy
    @variable = Variable.find(params[:id])
    @variable.destroy

    respond_to do |format|
      format.html { redirect_to(variables_url) }
      format.xml  { head :ok }
    end
  end
  
  def ajax_get_for_table
    
  end
    
end
