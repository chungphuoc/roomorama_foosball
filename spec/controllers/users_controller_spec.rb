require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let (:user) { FactoryGirl.create(:user) }
  let(:params) do
    HashWithIndifferentAccess.new('user' => {
                                    'first_name' => 'Chung',
                                    'last_name' => 'Phuoc'
                                  })
  end
  describe 'GET render get method page' do
    it 'render users index page' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'render users new page' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'render users edit page' do
      get :edit, id: user.id
      expect(response).to render_template(:edit)
    end
  end

  describe 'POST #create' do
    it 'redirects to the new user page after success' do
      post :create, params
      expect(response).to redirect_to users_path
      expect(flash[:notice]).to match(/^User was successfully created./)
    end
  end

  describe 'PUT #update' do
    it 'redirects to the new user page after success' do
      post :update, params.merge(id: user.id)
      expect(response).to redirect_to users_path
      expect(flash[:notice]).to match(/^User was successfully updated./)
    end
  end

  describe 'DELETE #destroy' do
    it 'redirects to the new user page after success' do
      post :destroy, id: user.id
      expect(response).to redirect_to users_path
      expect(flash[:notice]).to match(/^User was successfully removed./)
    end
  end
end
