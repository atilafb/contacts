require 'rails_helper'

RSpec.describe Contact, type: :model do
  subject(:new_contact) { described_class.new(user:, name: 'Maria') }

  let(:user) do
    User.create(name: 'Jose', age: 18, biography: 'A long history')
  end

  it 'requires a valid contact' do
    expect(new_contact).to be_valid
  end

  it 'requires the name is not empty to create a contact' do
    new_contact.name = nil
    expect(new_contact).not_to be_valid
  end

  it 'requires an user to create a contact' do
    new_contact.user = nil
    expect(new_contact).not_to be_valid
  end

  it 'requires the name has not already been taken to create a contact' do
    new_contact.save!
    invalid_contact = Contact.new(user:, name: 'Maria')
    invalid_contact.save
    expect(invalid_contact).not_to be_valid
  end

  it 'creates a contact with the same name to other user' do
    new_contact.save!
    second_user = User.create(name: 'Pedro', age: 42, biography: 'Another long history')
    valid_contact = Contact.new(user: second_user, name: 'Maria')
    valid_contact.save
    expect(valid_contact).to be_valid
  end
end
