class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_update_form
  before_action :set_question, only: [:destroy, :edit, :update]

  def index
  end

  def create
    @question = @update_form.questions.create!(question_params)

    if request.xhr?
      ActionCable.server.broadcast \
        "update_form_#{@update_form.id}_questions", { html: render(@question) }

      head :created
    end
  end

  def update
    @update_question = @question.update(question_params)
  end

  def destroy
    @question.destroy!

    if request.xhr?
      ActionCable.server.broadcast \
        "update_form_#{@update_form.id}_questions", { id: @question.id, destroyed: true }

      head :no_content
    end
  end

  private

  def set_update_form
    @update_form = current_user.update_forms.find(params[:update_form_id])
  end

  def set_question
    @question = @update_form.questions.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:text)
  end
end
