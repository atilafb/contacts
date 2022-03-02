class User < ApplicationRecord
  has_many :contacts, dependent: :destroy
  has_many :phones, through: :contacts
  validates_associated :contacts

  validates :name, presence: true, uniqueness: true
end
