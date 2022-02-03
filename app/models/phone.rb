class Phone < ApplicationRecord
  belongs_to :contact

  validates :number, presence: true, uniqueness: true
  validates :phone_kind, presence: true
  validates :is_main?, presence: true, uniqueness: { scope: :contact_id }
end
