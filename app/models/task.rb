class Task < ApplicationRecord
  belongs_to :user # Ensure this association exists
  validates :title, presence: true
end