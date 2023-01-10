class Journey < ApplicationRecord
  belongs_to :user
  has_many :city_journeys, dependent: :destroy
  has_many :cities, through: :city_journeys
  validates :start_date, presence: true
  validates :end_date, presence: true, comparison: { greater_than: :start_date }
  validates :name, presence: true
  validates :country, presence: true
  validates :tag, presence: true
  validate :journey_length

  def journey_length
    if end_date - start_date > 22
      errors.add(:end_date, "can't be more than 21 days after start date")
    end
  end
end
