class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show]
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def show; end

  def new
    @question = Question.new
  end

  def edit
    @question = current_user.questions.find(params[:id])
  end

  def create
    @question = current_user.questions.new(question_params)

    if @question.save
      redirect_to @question, notice: 'Question was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @question = current_user.questions.find(params[:id])

    if @question.update(question_params)
      redirect_to @question, notice: 'Question was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @question = current_user.questions.find(params[:id])

    if @question.destroy
      redirect_to questions_url, notice: 'Question was successfully destroyed.'
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, :content)
    end
end
