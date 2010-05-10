class RulesController < ApplicationController
  # GET /rules
  # GET /rules.xml
  def index
    databases = get_project.databases :include => [:rules]
    
    @database_rules = Hash.new
    databases.each do |d|
      @database_rules[d] = d.rules
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rules }
    end
  end

  # GET /rules/1
  # GET /rules/1.xml
  def show
    @rule = Rule.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rule }
    end
  end


  def new_1
    @databases = get_project.databases
  end
  
  def new_2
    @database = Database.find(params[:database_id], :include => :tables)
    @member_variable_types = MemberVariableType.all
    @codes = Code.all(:include => [:code_versions], :order => :name)
  end
  
  def ajax_get_variables_by_table
    variables = Table.find(params[:table_id]).variables
    render :update do |page|
      page.replace_html 'variables-select', :partial => 'rules/form/variables_select', :object => variables
    end
  end

  # GET /rules/new
  # GET /rules/new.xml
  def new
    @rule = Rule.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rule }
    end
  end

  # GET /rules/1/edit
  def edit
    @rule = Rule.find(params[:id])
  end

  # POST /rules
  # POST /rules.xml
  def create
    @rule = Rule.new
    @rule.name = params[:name]
    @rule.description = params[:description]
    @rule.tracking = params[:tracking]
    @rule.database = Database.find(params[:database_id])
    @rule.code = Code.find(params[:code_id])
    
    params[:member_variable].each do |id_name|
      regex = /.*_([0-9]+)/
      match = regex.match(id_name)
      v = match[1]
      mv = MemberVariable.new
      mv.rule = @rule
      mv.variable = Variable.find(v)
      mv.member_variable_type = MemberVariableType.find_by_name(params['member_variable_' + v].downcase)
      mv.save
    end

    respond_to do |format|
      if @rule.save
        flash[:notice] = 'Rule was successfully created.'
        format.html { redirect_to(@rule) }
        format.xml  { render :xml => @rule, :status => :created, :location => @rule }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rule.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rules/1
  # PUT /rules/1.xml
  def update
    @rule = Rule.find(params[:id])

    respond_to do |format|
      if @rule.update_attributes(params[:rule])
        flash[:notice] = 'Rule was successfully updated.'
        format.html { redirect_to(@rule) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rule.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rules/1
  # DELETE /rules/1.xml
  def destroy
    @rule = Rule.find(params[:id])
    @rule.destroy

    respond_to do |format|
      format.html { redirect_to(rules_url) }
      format.xml  { head :ok }
    end
  end
end
