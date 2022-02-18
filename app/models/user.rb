class User < ApplicationRecord
  has_many :contacts, dependent: :destroy
  validates_associated :contacts

  validates :name, presence: true, uniqueness: true

  def phones_count(id)
    Contact.where(user_id: id).joins(:phones).count
  end
end
