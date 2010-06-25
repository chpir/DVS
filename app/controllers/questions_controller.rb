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
  
  def new
    # Make sure defaults are set because we need it for the database
    redirect_to :action => :defaults if !session[:default_instrument] or !session[:default_table]
    
    # Load from defaults
    instrument = Instrument.find(session[:default_instrument])
    @table = Table.find(session[:default_table])
    @database = @table.database
    
    
    @rounds = get_project.rounds.all
    @regularexp = Regularexp.all
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
  
  def create
    variable = Variable.find(params[:question][:variable_id])
    variable.variable_type = VariableType.find(params[:variable][:variable_type_id])
    variable.save
    @question = Question.new(params[:question])
  
    # TODO why does this line have to be here? Won't set regexp_id without it :(
    @question.regularexp_id = params[:question][:regularexp_id]
    
    if @question.save
      flash[:notice] = "Successfully created question."
      redirect_to @question
    else
      render :action => 'new'
    end
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
end
