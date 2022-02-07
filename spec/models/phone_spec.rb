require 'rails_helper'

RSpec.describe Phone, type: :model do
  let!(:user) {
    User.create(name: 'Jose', age: 18, biography: 'A long history')
  }
  let!(:contact) {
    Contact.create(user: user, name: 'Maria')
  }

  subject { Phone.new(contact: contact, number: '11112222', phone_kind: 'Casa', is_main: true) }

  it 'create a valid phone' do
    expect(subject).to be_valid
  end

  it 'do not create a phone without a contact' do
    subject.contact = nil
    expect(subject).to_not be_valid
  end

  it 'do not create a phone without a number' do
    subject.number = nil
    expect(subject).to_not be_valid
  end

  it 'do not create a phone without a phone_kind' do
    subject.phone_kind = nil
    expect(subject).to_not be_valid
  end

  it 'do not create a phone without is_main validation' do
    subject.is_main = nil
    expect(subject).to_not be_valid
  end

  it 'do not create a phone if the number has already been taken' do
    subject.save!
    invalid_number = Phone.new(contact: contact, number: '11112222', phone_kind: 'Casa', is_main: false)
    invalid_number.save
    expect(invalid_number).to_not be_valid
  end

  it 'create a phone with the same number to other user' do
    subject.save!
    second_contact = Contact.create(user: user, name: 'Marcos')
    valid_phone = Phone.new(contact: second_contact, number: '11112222', phone_kind: 'Casa', is_main: false)
    valid_phone.save
    expect(valid_phone).to be_valid
  end

  it 'do not create phone with is_main true if there is another phone as true' do
    subject.save!
    invalid_phone = Phone.new(contact: contact, number: '33334444', phone_kind: 'Casa', is_main: true)
    invalid_phone.save
    expect(invalid_phone).to_not be_valid
  end
end
