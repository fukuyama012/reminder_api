class Category < ApplicationRecord
  has_many :reminders
  validates :name, presence: true, uniqueness: true
end
