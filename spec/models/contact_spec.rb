require 'rails_helper'

RSpec.describe Contact, type: :model do
  let!(:user) {
    User.create(name: 'Jose', age: 18, biography: 'A long history')
  }

  subject { Contact.new(user: user, name: 'Maria') }

  it 'create a valid contact' do
    expect(subject).to be_valid
  end

  it 'do not create a contact without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'do not create a contact without an user' do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it 'do not create a contact if the name has already been taken' do
    subject.save!
    invalid_contact = Contact.new(user: user, name: 'Maria')
    invalid_contact.save
    expect(invalid_contact).to_not be_valid
  end

  it 'create a contact with the same name to other user' do
    subject.save!
    second_user = User.create(name: 'Pedro', age: 42, biography: 'Another long history')
    valid_contact = Contact.new(user: second_user, name: 'Maria')
    valid_contact.save
    expect(valid_contact).to be_valid
  end
end
