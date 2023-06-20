class AnswersController < ApplicationController
  def create
    @answer = current_user.answers.new(answer_params)

    if @answer.save
      redirect_to @answer.question, notice: 'Answer was successfully created.'
    else
      @question = @answer.question
      render 'questions/show'
    end

  end

  private

    def answer_params
      params.require(:answer).permit(:content).merge(question_id: params[:question_id])
    end
end
