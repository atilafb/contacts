require 'rails_helper'

RSpec.describe Phone, type: :model do
  subject(:new_phone) { Phone.new(contact:, number: '11112222', phone_kind: 'casa', principal: true) }

  let(:user) do
    User.create(name: 'Jose', age: 18, biography: 'A long history')
  end
  let(:contact) do
    Contact.create(user:, name: 'Maria')
  end

  it 'requires a valid phone' do
    expect(new_phone).to be_valid
  end

  it 'requires a contact to create a phone' do
    new_phone.contact = nil
    expect(new_phone).not_to be_valid
  end

  it 'requires a number to create a phone' do
    new_phone.number = nil
    expect(new_phone).not_to be_valid
  end

  it 'requires a phone_kind to create a phone' do
    new_phone.phone_kind = nil
    expect(new_phone).not_to be_valid
  end

  it 'requires phone_kind to be included in the list' do
    new_phone.phone_kind = 'outra coisa'
    expect(new_phone).not_to be_valid
  end

  it 'requires the number has not already been taken to create a phone' do
    new_phone.save!
    invalid_number = Phone.new(contact:, number: '11112222', phone_kind: 'casa', principal: false)
    invalid_number.save
    expect(invalid_number).not_to be_valid
  end

  it 'creates a phone with the same number to other user' do
    new_phone.save!
    second_contact = Contact.create(user:, name: 'Marcos')
    valid_phone = Phone.new(contact: second_contact, number: '11112222', phone_kind: 'casa', principal: false)
    valid_phone.save
    expect(valid_phone).to be_valid
  end

  it 'requires the is_main is the only true value to create another phone' do
    new_phone.save!
    invalid_phone = Phone.new(contact:, number: '33334444', phone_kind: 'casa', principal: true)
    invalid_phone.save
    expect(invalid_phone).not_to be_valid
  end
end
