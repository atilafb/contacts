require 'rails_helper'

RSpec.describe User, type: :model do
  fixtures :users
  context 'create a simple user when have a valid input' do
    it 'check if the input is valid' do
      # Setup & Exercise
      user = User.new(name: 'usuario')
      # Verify
      expect(user.name).to match(/[a-zA-Z]/)
    end
  end
  context 'can not create a user without a name' do
    it 'validate when the input is empty' do
      # Setup
      user = User.new
      # Exercise
      user.validate
      # Verify
      expect(user.errors[:name]).to include("can't be blank")
    end
  end
end
