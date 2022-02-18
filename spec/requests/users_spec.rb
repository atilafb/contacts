require 'rails_helper'

RSpec.describe "Users", type: :request do
  subject(:new_user) { User.new(name: 'Joao', age: 16, biography: 'A short history') }

  describe 'GET /index' do
    it 'returns http success' do
      get users_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      new_user.save
      get user_path(new_user.id)
      expect(response).to have_http_status(:success)
    end
  end
end
