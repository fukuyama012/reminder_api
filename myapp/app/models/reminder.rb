class Reminder < ApplicationRecord
  belongs_to :category
  validates :notify, presence: true
  validates :cycle_days, presence: true, numericality: { only_integer: true }
end
