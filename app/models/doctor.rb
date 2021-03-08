class Doctor < ApplicationRecord
  has_many :doctor_surgeries
  has_many :surgeries, through: :doctor_surgeries

  def self.most_to_least_practiced
    Doctor.select("doctors.*")
    .order(years_practiced: :desc)
  end

  def self.find_by_name(name)
    Doctor.where("name = ?", name).first
  end
end
