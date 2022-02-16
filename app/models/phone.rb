class Phone < ApplicationRecord
  belongs_to :contact

  validates :number, presence: true, uniqueness: { scope: :contact_id }
  validates :phone_kind, presence: true
  validates :is_main, inclusion: { in: [true, false] }, uniqueness: { scope: :contact_id, conditions: lambda {
                                                                                                        where(is_main: true)
                                                                                                      } }
end
