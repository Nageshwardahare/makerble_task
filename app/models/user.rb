class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { receptionist: 0, doctor: 1, admin: 2 }

  validates :full_name, :dob, presence: true
  validate :dob_cannot_be_today_or_future

  private

  def dob_cannot_be_today_or_future
    if dob.present? && dob >= Date.today
      errors.add(:dob, "can't be today or in the future")
    end
  end
end
