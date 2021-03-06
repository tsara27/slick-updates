class UpdateFormsController < ApplicationController
  before_action :authenticate_user!

  def index
    @update_forms = current_user.update_forms
  end

  def new
    @update_form = current_user.update_forms.new
  end

  def create
    @update_form = current_user.update_forms.create(update_form_params)

    redirect_to update_form_questions_path(@update_form)
  end

  private

  def update_form_params
    params.require(:update_form).permit(:name)
  end
end
