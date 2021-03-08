class Doctor < ApplicationRecord
  has_many :doctor_surgeries
  has_many :surgeries, through: :doctor_surgeries

  def self.most_to_least_practiced
    Doctor.select("doctors.*")
    .order(years_practiced: :desc)
  end
end
