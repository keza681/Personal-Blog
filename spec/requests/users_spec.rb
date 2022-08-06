require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) { get users_path }

    it 'Should check if the action returns a correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'Should check if the action rendered a correct template as provided in the requirement' do
      expect(response).to render_template('index')
    end

    it 'Should check if the correct placeholder text is being shown' do
      expect(response.body).to include('User#Index')
    end
  end

  describe 'GET /show' do
    before(:example) { get user_path(10) }

    it 'Should check if the action returns a correct response status provided' do
      expect(response).to have_http_status(:ok)
    end

    it 'Should check if the action rendered a correct template as the one required' do
      expect(response).to render_template('show')
    end

    it 'Should checks if the correct placeholder text is being shown' do
      expect(response.body).to include('User#Show')
    end
  end
end