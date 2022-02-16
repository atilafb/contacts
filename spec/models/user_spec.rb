require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Jose', age: 18, biography: 'A long history') }

  it 'create a user with name' do
    expect(subject).to be_valid
  end

  it 'do not create a user without name' do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it 'do not create a user if the name has already been taken' do
    subject.save!
    invalid_user = User.new(name: 'Jose')
    invalid_user.save
    expect(invalid_user).not_to be_valid
  end
end
