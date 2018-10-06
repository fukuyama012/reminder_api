class Category < ApplicationRecord
  has_many :reminder
  validates :name, presence: true, uniqueness: true
end
