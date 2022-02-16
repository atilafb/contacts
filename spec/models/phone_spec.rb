require 'rails_helper'

RSpec.describe Phone, type: :model do
  subject { Phone.new(contact:, number: '11112222', phone_kind: 'Casa', is_main: true) }

  let!(:user) do
    User.create(name: 'Jose', age: 18, biography: 'A long history')
  end
  let!(:contact) do
    Contact.create(user:, name: 'Maria')
  end

  it 'create a valid phone' do
    expect(subject).to be_valid
  end

  it 'do not create a phone without a contact' do
    subject.contact = nil
    expect(subject).not_to be_valid
  end

  it 'do not create a phone without a number' do
    subject.number = nil
    expect(subject).not_to be_valid
  end

  it 'do not create a phone without a phone_kind' do
    subject.phone_kind = nil
    expect(subject).not_to be_valid
  end

  it 'do not create a phone without is_main validation' do
    subject.is_main = nil
    expect(subject).not_to be_valid
  end

  it 'do not create a phone if the number has already been taken' do
    subject.save!
    invalid_number = Phone.new(contact:, number: '11112222', phone_kind: 'Casa', is_main: false)
    invalid_number.save
    expect(invalid_number).not_to be_valid
  end

  it 'create a phone with the same number to other user' do
    subject.save!
    second_contact = Contact.create(user:, name: 'Marcos')
    valid_phone = Phone.new(contact: second_contact, number: '11112222', phone_kind: 'Casa', is_main: false)
    valid_phone.save
    expect(valid_phone).to be_valid
  end

  it 'do not create phone with is_main true if there is another phone as true' do
    subject.save!
    invalid_phone = Phone.new(contact:, number: '33334444', phone_kind: 'Casa', is_main: true)
    invalid_phone.save
    expect(invalid_phone).not_to be_valid
  end
end
