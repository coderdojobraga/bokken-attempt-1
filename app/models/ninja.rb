class Ninja < ApplicationRecord
  validates :name, presence: true, length: { maximum: 75 }
  validates :guardian_name, presence: true, length: { maximum: 75 }
  validates :guardian_contact, email: true
end
