# spec/requests/users_controller_spec.rb
require 'rails_helper'

RSpec.describe UsersController, type: :request do
  fixtures :users

  describe 'GET #index' do
    it 'returns a successful response' do
      get users_path
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get users_path
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get users_path
      expect(response.body).to include('All Users')
    end
  end

  describe 'GET #show' do
    let(:user) { users(:user_one) }

    it 'returns a successful response' do
      get user_path(user.id)
      expect(response).to be_successful
    end

    it 'renders the show template' do
      get user_path(user.id)
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      get user_path(user.id)
      expect(response.body).to include('User Profile')
    end
  end
end
