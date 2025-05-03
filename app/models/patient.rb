class Patient < ApplicationRecord
  validates :full_name, :age, :diagnosis, presence: true
  scope :recent, -> { order(created_at: :desc) }
end
