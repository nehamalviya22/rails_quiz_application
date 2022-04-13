class Admin::QuestionsController < ApplicationController
  before_action :require_signin
  def index
    @questions = Question.all
  end
  
  def new
    @question = Question.new
    1.times { @question.options.build }
    1.times { @question.answers.build }
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    puts(question_params)
    
    @question = Question.new(question_params)
    if @question.save
      redirect_to admin_questions_path
    else
      render :new
    end
  end

private

  def question_params
    params.require(:question).permit(:description, :maxtime, 
    options_attributes: [:a,:b,:c,:d], answers_attributes: [:correct_answer])
  end
end
