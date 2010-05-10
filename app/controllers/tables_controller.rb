require 'pp'

class TablesController < ApplicationController
  # GET /tables
  # GET /tables.xml
  
  skip_before_filter :verify_authenticity_token, :only => [:batch_create]
  before_filter :require_user, :except => :batch_create
  
  
  def index
    databases = get_project.databases :include => [:tables]
    
    @database_tables = Hash.new
    databases.each do |d|
      @database_tables[d] = d.tables
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => get_project.tables }
    end
  end

  # GET /tables/1
  # GET /tables/1.xml
  def show
    @table = Table.find(params[:id], :include => [:database, :table_type])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @table }
    end
  end


  # GET /tables/new
  # GET /tables/new.xml
  def new
    @table = Table.new
    @databases = get_project.databases

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @table }
    end
  end

  # GET /tables/1/edit
  def edit
    @table = Table.find(params[:id])
    @databases = get_project.databases
  end

  # POST /tables
  # POST /tables.xml
  def create
    @table = Table.new(params[:table])

    respond_to do |format|
      if @table.save
        flash[:notice] = 'Table was successfully created.'
        format.html { redirect_to(@table) }
        format.xml  { render :xml => @table, :status => :created, :location => @table }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @table.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  
  def batch_create
    params['tables']['table'].each do |v|
      table = Table.new
      table.name = v['name']
      table.database_id = v['database_id']
      table.variables = Array.new
      table.table_type = TableType.find_by_name('Base')
      v['variable'].each do |vv|
        variable = Variable.new
        variable.name = vv['name']
        variable.identifier = ( vv.has_key?('identifier') ? true : false )
        table.variables << variable
      end
      table.save      
    end
    head :ok
  end

  # PUT /tables/1
  # PUT /tables/1.xml
  def update
    @table = Table.find(params[:id])

    respond_to do |format|
      if @table.update_attributes(params[:table])
        flash[:notice] = 'Table was successfully updated.'
        format.html { redirect_to(@table) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @table.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tables/1
  # DELETE /tables/1.xml
  def destroy
    @table = Table.find(params[:id])
    @table.destroy

    respond_to do |format|
      format.html { redirect_to(tables_url) }
      format.xml  { head :ok }
    end
  end
  
  private
      def single_access_allowed?
        action_name == "batch_create"
      end
end


