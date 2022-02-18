class Phone < ApplicationRecord
  belongs_to :contact

  validates :number, presence: true, uniqueness: { scope: :contact_id }
  validates :phone_kind, inclusion: { in: ['casa', 'trabalho', 'outro'] }
  validates :principal, uniqueness: {
    scope: :contact_id,
    conditions: lambda { where(principal: true) }
  }
end
