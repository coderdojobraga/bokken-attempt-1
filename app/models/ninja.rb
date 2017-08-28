class Ninja < ApplicationRecord
  validates :name, presence: true, length: { maximum: 75 }

  validates :guardian_name, presence: true, length: { maximum: 75 }

  validates_format_of :guardian_contact, with:  /@/
end
