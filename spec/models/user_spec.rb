require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:new_user) { described_class.new(name: 'Jose', age: 18, biography: 'A long history') }

  it 'requires the name to create a user' do
    expect(new_user).to be_valid
  end

  it 'requires the name is not empty to create a user' do
    new_user.name = nil
    expect(new_user).not_to be_valid
  end

  it 'requires the name has not already been taken' do
    new_user.save!
    invalid_user = User.new(name: 'Jose')
    invalid_user.save
    expect(invalid_user).not_to be_valid
  end
end
