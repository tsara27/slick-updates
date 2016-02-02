require 'rails_helper'

RSpec.describe QuestionsController, :type => :controller do
  describe 'PATCH #update' do
    let(:user) { create(:user) }
    let(:update_form) { create(:update_form, user: user) }
    let(:question) { create(:question, update_form: update_form) }


    it "should update question successfully" do
      sign_in user
      process :update, method: :patch, params: { update_form_id: update_form.id,
                                                 id: question.id,
                                                 question: { text: 'What is your name?' } }

      question.reload
      expect(question.text).to eq 'What is your name?'
    end

    it "should not update question with unauthenticated user" do
      process :update, method: :patch, params: { update_form_id: update_form.id,
                                                 id: question.id,
                                                 question: { text: 'What is your name?' } }

      question.reload
      expect(question.text).not_to eq 'What is your name?'
    end
  end
end
