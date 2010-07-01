class QuestionsController < ApplicationController
  def index
    @questions = get_project.questions.all
  end
  
  def defaults
    if request.post?
      i = Instrument.find(params[:instrument][:id])
      t = Table.find(params[:table][:id])
      session[:default_instrument] = i.id
      session[:default_table] = t.id
      flash[:notice] = "Default instrument: #{i.round.project.name} > #{i.round.name} > #{i.name}<br/><br/>Default table: #{t.database.project.name} > #{t.database.name} > #{t.name}"
      redirect_to :action => :new
    else
      @rounds = get_project.rounds.all
      @databases = get_project.databases.all
    end
  end

  
  def show
    @question = Question.find(params[:id])
  end
  
  def export
    @rounds = Round.all(:include => {:instruments => {:questions => [:regularexp, {:variable => :table}]}})
  end
  
  def new
    
    # Make sure defaults are set because we need it for the database
    if (!session[:default_instrument] or !session[:default_table])
      instrument = Instrument.first
      @table = Table.first
    else
      instrument = Instrument.find(session[:default_instrument])      
      @table = Table.find(session[:default_table])
    end
    
    # Load from defaults

    
    @database = @table.database
    
    
    @rounds = get_project.rounds.all
    @regularexp = Regularexp.all(:order => :name)
    @variable_types = VariableType.all
    
    @question = Question.new
    @question.instrument_id = instrument.id
  end
  
  def ajax_get_variables_by_table
    variables = Table.find(params[:table_id]).variables
    render :update do |page|
      page.replace_html 'variables-select', :partial => 'questions/form/variables_select', :object => variables
    end
  end
    
  def ajax_get_variable
    variable = Variable.find(params[:variable_id])
    render :update do |page|
      page.replace_html 'variable-type', :partial => 'questions/form/variable_type', :object => variable
    end
  end
  
  def ajax_get_regularexp
    regularexp = Regularexp.find(params[:question_regularexp_id])
    coder = HTMLEntities.new
    rule = coder.encode(regularexp.rule)
    render :update do |page|
      page << "$j('.regularexp').html(\"#{rule}\");"
    end
  end
  
  def create
    @question = Question.new(params[:question])

    if params[:question][:variable_id] && !params[:question][:variable_id].blank? && params[:variable][:variable_type_id] && !params[:variable][:variable_type_id].blank?
      variable = Variable.find(params[:question][:variable_id])
      variable.variable_type = VariableType.find(params[:variable][:variable_type_id])
      variable.save
    else
       raise MissingVariableType
     end
    

    # TODO why does this line have to be here? Won't set regexp_id without it :(
    @question.regularexp_id = params[:question][:regularexp_id]
    
    if @question.save
      flash[:notice] = "Successfully created question."
      redirect_to @question
    else
      render :action => 'new'
    end
  rescue MissingVariableType => err
    flash[:notice] = "Invalid form submission: #{err.clean_message}"
    redirect_to @question
  end

  
  def edit
    @question = Question.find(params[:id])
    @rounds = get_project.rounds.all
  end
  
  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(params[:question])
      flash[:notice] = "Successfully updated question."
      redirect_to @question
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = "Successfully destroyed question."
    redirect_to questions_url
  end
  
  private
    def single_access_allowed?
      action_name == "export"
    end
end


class MissingVariableType < StandardError; end
