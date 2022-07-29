class Freelancer < ApplicationRecord
  belongs_to :user

  validates :bio, presence: :true,  length: { minimum: 20 }
  validates :rate, presence: :true, numericality: { only_integer: true }

  delegate :first_name, :last_name, to: :user

  def full_name
    "#{first_name} #{last_name}"
  end
end
