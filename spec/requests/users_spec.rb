require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    subject(:users) { User.all }
    subject(:user) { User.new(name: 'Thomas', age: 32, biography: 'Born in Birmigham') }

    it "returns http success" do
      get users_path
      user.save
      expect(response).to have_http_status(:success)
      expect(users).to eq(User.all)
    end
  end
end
