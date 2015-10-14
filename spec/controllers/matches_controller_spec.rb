require 'rails_helper'

RSpec.describe MatchesController, type: :controller do
  let (:match) { FactoryGirl.create(:match) }
  describe 'GET render get method page' do
    it 'render matches index page' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'render matches new page' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'render matches edit page' do
      get :edit, id: match.id
      expect(response).to render_template(:edit)
    end
  end

  describe 'DELETE #destroy' do
    it 'redirects to the list matches page after success' do
      puts match.inspect
      delete :destroy, id: match.id
      expect(response).to redirect_to matches_path
      expect(flash[:notice]).to eq('Match was successfully removed.')
    end
  end
end
