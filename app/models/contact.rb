class Contact < ApplicationRecord
  belongs_to :user
  has_many :phones

  validates :name, presence: true, uniqueness: { scope: :user }
end
